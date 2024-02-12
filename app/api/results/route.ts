import { getCareers } from "@/app/actions/careers"
import { QUESTION_TYPES } from "@/lib/constants"
import { completition, getLangFuse } from "@/lib/openai"
import prisma from "@/lib/prisma"
import { sliderResponseToText } from "@/lib/utils"
import { NextRequest, NextResponse } from "next/server"
import { retry } from "radash"
import { v4 as uuid } from "uuid"
import {
  calculateMBTI,
  getUserPersonalityByName,
} from "@/app/actions/user-personality"
import { auth } from "auth"
import { getProfile, getUserByEmail } from "@/app/actions/user"

async function mapCareers(evaluationResponse: any) {
  const jsonRes = JSON.parse(evaluationResponse)

  const careers = await getCareers()

  const sorted = jsonRes.careers
    .map((r) => ({
      ...r,
      data: careers.find((c) => c.id === r.uid),
    }))
    .sort((a, b) => b.rating - a.rating)

  return {
    careers: sorted,
  }
}

export async function POST(request: NextRequest) {
  const session = await auth()

  if (session) {
    const user = await getUserByEmail(session.user.email)
    const profilefull = await getProfile({ userId: user.id })

    console.log("Returning user profile")
    return NextResponse.json({
      ...(await mapCareers(profilefull.evaluation_response)),
      personality: profilefull.userPersonality,
    })
  }

  const { uid } = await request.json()

  console.log(uid)

  try {
    const profile = await getProfile({ uid })

    if (profile?.evaluation_response) {
      console.log("using cached response", profile)
      return NextResponse.json({
        ...(await mapCareers(profile.evaluation_response)),
        personality: profile.userPersonality,
      })
    }
  } catch (error) {
    console.log("Profile not found")
  }

  const userResponses = await prisma?.evaluationFormUserResponse.findMany({
    where: {
      AND: [
        {
          uid: `${uid}`,
        },
        {
          EvaluationFormQuestion: {
            type: {
              not: "mbti",
            },
          },
        },
        {
          EvaluationFormQuestion: {
            status: "published",
          },
        },
      ],
    },
    select: {
      answer: true,
      EvaluationFormQuestion: {
        select: {
          id: true,
          type: true,
          question: true,
        },
      },
    },
  })

  const userResponsesText = userResponses
    .map((r) => {
      if (r.EvaluationFormQuestion.type === QUESTION_TYPES.Range) {
        return `${r.EvaluationFormQuestion.question}  ${sliderResponseToText(
          r.answer,
        )}`
      }
      return `${r.EvaluationFormQuestion.question} ${r.answer}`
    })
    .join("\n")

  console.log("userResponsesText", userResponsesText)

  const careers = await getCareers()

  const careersText = careers
    .map((c) => `uid: "${c.id}" - name: "${c.name}"`)
    .join("\n")

  const mbtiResult = await calculateMBTI(uid)
  console.log(mbtiResult)

  const personality = await getUserPersonalityByName(mbtiResult)

  console.log(personality)

  const staticPrompt = process.env.PROMPT;

  if (!staticPrompt) {
    throw new Error("No prompt found");
  }

  const replacementDic = {
    "{userResponsesText}": userResponsesText,
    "{personality.name}": personality.name,
    "{personality.you_at_work}": personality.you_at_work,
    "{personality.strengths_summary}": personality.strengths_summary,
    "{personality.teamwork}": personality.teamwork,
    "{personality.communications_skills}": personality.communications_skills,
    "{personality.leadership}": personality.leadership,
    "{careersText}": careersText,
  };

  const prompt = Object.entries(replacementDic).reduce(
    (acc, [key, value]) => acc.replace(key, value),
    staticPrompt,
  );

  console.log(prompt)

  const res = await retry(
    {
      times: 10,
      delay: 100,
    },
    async () => {
      console.log("trying to get results")

      const langfuse = getLangFuse();

      const traceClient = langfuse.trace({
        name: "/api/results",
        userId: uid,
        input: staticPrompt,
        metadata: {
          uid,
          mbti: mbtiResult,
          userResponsesText,
          replacementDic,
        },
        tags: [process.env.NODE_ENV],
      });

      const modelResponse = await completition(prompt, traceClient)

      const choices =
        modelResponse?.choices?.[0]?.message?.function_call?.arguments || ""

      const fnResponse = JSON.parse(choices)

      console.log("careers", fnResponse)

      if (fnResponse.careers.some((c) => c.rating <= 1)) {
        console.log("Some careers don't have a rating")
        throw new Error("Some careers don't have a rating")
      }

      // check if gpt halucionate a career that doesn't exist
      if (
        fnResponse.careers.some(
          (c) => !careers.find((career) => career.id === c.uid),
        )
      ) {
        console.log("Some careers don't exist")
        throw new Error("Some careers don't exist")
      }

      try {
        const profileResult = await prisma.profile.upsert({
          where: {
            uid,
          },
          create: {
            id: uuid(),
            status: "published",
            evaluation_response: JSON.stringify(fnResponse),
            uid: `${uid}`,
            personality: personality.id,
          },
          update: {
            evaluation_response: JSON.stringify(fnResponse),
            personality: personality.id,
          },
        })

        traceClient.update({
          output: modelResponse,
          metadata: {
            profile: profileResult,
          },
        });
      } catch (e) {
        console.log(e)
      }

      return getProfile({ uid })
    },
  )

  const data = await mapCareers(res.evaluation_response)
  return NextResponse.json({
    ...data,
    personality,
  })
}

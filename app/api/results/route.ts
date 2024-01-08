import { getCareers } from "@/app/actions/careers"
import { QUESTION_TYPES } from "@/lib/constants"
import { completition } from "@/lib/openai"
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

  const prompt = `Benutzerprofil:
  
  ${userResponsesText}

  ${personality.name}
  ${personality.you_at_work}
  ${personality.strengths_summary}
  ${personality.teamwork}
  ${personality.communications_skills}
  ${personality.leadership}

Aufgabenanweisungen:

Stellen Sie sich vor, Sie sind ein fortschrittlicher KI-Karriereberater. Basierend auf den persönlichen Werten des Benutzers und seiner idealen Arbeitsumgebung, generieren Sie die folgenden Variablen:

Sie bei der Arbeit: Beschreiben Sie den Arbeitsstil des Benutzers unter Berücksichtigung seiner Werte und Vorlieben.
Stärken: Zählen Sie die Stärken des Benutzers auf, basierend auf seinen Werten und wie diese Stärken mit seiner idealen Arbeitsumgebung in Einklang stehen.
Sobald Sie diese Variablen generiert haben, ordnen Sie das Benutzerprofil den am besten geeigneten Karrierewegen aus der bereitgestellten Liste zu. Weisen Sie jedem Beruf eine Prozentbewertung zu, die den Grad der Eignung angibt. Ordnen Sie die Berufe absteigend nach der Prozentübereinstimmung an.


Zusätzliche Richtlinien:

Berücksichtigen Sie die generierten Variablen ('youAtWork' und 'strengths') sorgfältig bei den Zuordnungen.
Geben Sie für jede Zuordnung eine detaillierte Analyse ab, in der erklärt wird, warum der Beruf zum Benutzerprofil passt.
Gewährleisten Sie Genauigkeit und Gründlichkeit bei Ihren Bewertungen.
Verwenden Sie Prozentbewertungen, um die Eignung jedes Berufs zu quantifizieren.
Kommentieren Sie nicht das Ergebnis; konzentrieren Sie sich darauf, präzise und fundierte Zuordnungen bereitzustellen.

Only use the following Careers:
${careersText}

`
  console.log(prompt)

  const res = await retry(
    {
      times: 5,
      delay: 1000,
    },
    async () => {
      console.log("trying to get results")

      const modelResponse = await completition(prompt)

      const choices =
        modelResponse?.choices?.[0]?.message?.function_call?.arguments || ""

      const fnResponse = JSON.parse(choices)

      console.log("careers", fnResponse)

      if (fnResponse.careers.some((c) => c.rating <= 1)) {
        throw new Error("Some careers don't have a rating")
      }

      // check if gpt halucionate a career that doesn't exist
      if (
        fnResponse.careers.some(
          (c) => !careers.find((career) => career.id === c.uid),
        )
      ) {
        throw new Error("Some careers don't exist")
      }

      try {
        await prisma.profile.upsert({
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

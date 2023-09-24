import { QUESTION_CATEGORIES } from "@/lib/constants"
import { completition } from "@/lib/openai"
import prisma from "@/lib/prisma"
import { NextRequest, NextResponse } from "next/server"
export async function GET(request: Request) {}
export async function POST(request: NextRequest) {
  const { uid } = await request.json()

  let res = await prisma?.modelQuestionResponseResult?.findFirst({
    where: {
      questionResponseId: uid
    }
  })

  if(res?.result) {
    console.log('returning saved value in db')
    return NextResponse.json(JSON.parse(res.result.toString()))
  }

  console.log('calculating careers')

  const userResponse = await prisma?.userResponses.findFirst({
    where: {
      uid,
    },
    include: {
      responses: true,
    },
  })

  // load questions
  const questions = await prisma?.question?.findMany({
    orderBy: {
      category: "asc",
    },
  })

  const groupedQuestions = questions.reduce((prev, q) => {
    const response = userResponse.responses.find((r) => r.questionId === q.id)

    prev[q.category] = prev[q.category] || []
    if (response) {
      const item = {
        question: q,
        response,
        text: `${q.question}\n${response.response}`,
      }
      prev[q.category].push(item)
    }
    return prev
  }, {})

  // get responses

  const valueQuestions = groupedQuestions[QUESTION_CATEGORIES.Values]
    .map((r) => r.text)
    .join("\n")

  const strengthQuestions = groupedQuestions[QUESTION_CATEGORIES.Strengths]
    .map((r) => r.text)
    .join("\n")

  const idealEnvQuestions = groupedQuestions[
    QUESTION_CATEGORIES.IdealEnvironment
  ]
    .map((r) => r.text)
    .join("\n")

  
  const careers = (await prisma.careers.findMany()).map(c => `uid: ${c.id} - name: ${c.name}`).join('\n')

  const prompt = `A person has:
  the following strengths: {strengths} 
  the following personal values: {values} 
  the following ideal working environment: {environment}
  
  Rank the following professions according to which one suits this person best and give a percentage rating. Arrange them in descending order. Don't comment on the result.
  
  ${careers}`
    .replace("{values}", valueQuestions)
    .replace("{strengths}", strengthQuestions)
    .replace("{environment}", idealEnvQuestions)

  const modelResponse = await completition(prompt)

  const choices = modelResponse.choices?.[0]?.message?.function_call?.arguments || ""

  res = await prisma.modelQuestionResponseResult.upsert({
    where: {
      questionResponseId: userResponse.uid
    },
    create: {
      response: JSON.stringify(modelResponse),
      result: choices,
      questionResponseId: uid
    },
    update: {
      response: JSON.stringify(modelResponse),
      result: choices,
    }
  })

  return NextResponse.json(JSON.parse(res.result.toString()))
}

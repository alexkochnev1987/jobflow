import { QUESTION_CATEGORIES } from "@/lib/constants"
import prisma from "@/lib/prisma"
import { NextRequest, NextResponse } from "next/server"
export async function GET(request: Request) {}
export async function POST(request: NextRequest) {
  const { uid } = await request.json()
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

  const prompt = `A person has:
  the following strengths: {strengths} 
  the following personal values: {values} 
  the following ideal working environment: {environment}
  
  Rank the following professions according to which one suits this person best and give a percentage rating. Arrange them in descending order. Don't comment on the result.
  
  1. Web-Entwickler
  2. UX-Designer
  3. Product Manager
  4. Flugbegleiter
  5. Rettungssanitäter
  6. Sales Manager`
    .replace("{values}", valueQuestions)
    .replace("{strengths}", strengthQuestions)
    .replace("{environment}", idealEnvQuestions)

    

  return NextResponse.json({
    prompt,
  })
}

import { getCareers } from "@/app/actions/server"
import { QUESTION_CATEGORIES } from "@/lib/constants"
import { completition } from "@/lib/openai"
import prisma from "@/lib/prisma"
import { NextRequest, NextResponse } from "next/server"

async function mapCareers(res: any) {
  const jsonRes = JSON.parse(res.result.toString())
  console.log(jsonRes)
  const careers = await getCareers()

  const sorted = jsonRes.careers
    .map((r) => ({
      ...r,
      data: careers.find((c) => c.id === r.uid),
    }))
    .sort((a, b) => b.rating - a.rating)

  return {
    youAtWork: (jsonRes.youAtWork || "").split("\n").filter((t) => t !== ""),
    strengths: (jsonRes.strengths || "").split("\n").filter((t) => t !== ""),
    careers: sorted,
  }
}

export async function POST(request: NextRequest) {
  const post = await request.json()
  console.log(post)
  const { uid } = await request.json()

  let res = await prisma?.modelQuestionResponseResult?.findFirst({
    where: {
      questionResponseId: uid,
    },
  })

  if (res?.result) {
    console.log("returning saved value in db")
    const data = await mapCareers(res)
    return NextResponse.json(data)
  }

  console.log("calculating careers")

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

  const careers = (await prisma.careers.findMany())
    .map((c) => `uid: ${c.id} - name: ${c.name}`)
    .join("\n")

  const prompt = `A person has:
  the following strengths: {strengths} 
  the following personal values: {values} 
  the following ideal working environment: {environment}
  
  Rank the following professions according to which one suits this person best and give a percentage rating. Arrange them in descending order. Don't comment on the result.
  ${careers}
  Also output 5 lines about the user strenghs, and user at Work
  Examples:
  """You at Work
  In your professional life, you thrive when your work aligns with your deeply held beliefs and values.

  You shine in roles that allow for creative expression and independence, where you can contribute your unique perspective.

As a colleague, your approachability and supportiveness make you an essential team member, often providing emotional stability.

You may find routine tasks less engaging, but when you can infuse your creativity and passion into your work, you become a catalyst for positive change in your workplace.

Strengths
You excel at fostering positive working relationships due to your innate empathy and understanding of others.

Your creativity shines through in problem-solving, offering innovative perspectives that can lead to breakthroughs.

Dedication and passion drive you to give your best to projects aligned with your values, making you a source of inspiration for your team.

Your adaptability and open-mindedness enable you to thrive in diverse work environments, embracing change as an opportunity for growth."""
  
    `
    .replace("{values}", valueQuestions)
    .replace("{strengths}", strengthQuestions)
    .replace("{environment}", idealEnvQuestions)

  const modelResponse = await completition(prompt)

  const choices =
    modelResponse.choices?.[0]?.message?.function_call?.arguments || ""

  res = await prisma.modelQuestionResponseResult.upsert({
    where: {
      questionResponseId: userResponse.uid,
    },
    create: {
      response: JSON.stringify(modelResponse),
      result: choices,
      questionResponseId: uid,
    },
    update: {
      response: JSON.stringify(modelResponse),
      result: choices,
    },
  })

  const data = await mapCareers(res)
  return NextResponse.json(data)
}

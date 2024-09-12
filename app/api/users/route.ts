import prisma from "@/lib/prisma"
import { NextRequest, NextResponse } from "next/server"
export async function GET(request: Request) {}
export async function POST(request: NextRequest) {
  const { questionResponse, questionId, uid } = await request.json()

  const savedResponse = await prisma?.evaluationFormUserResponse.findFirst({
    where: {
      AND: [
        {
          question: questionId,
        },
        {
          uid,
        },
      ],
    },
    select: {
      id: true,
    },
  })

  if (savedResponse) {
    const updateResponse = await prisma?.evaluationFormUserResponse.update({
      where: {
        id: savedResponse.id,
      },
      data: {
        answer: questionResponse,
      },
    })
    return NextResponse.json({ updateResponse })
  }

  // save QuestionResponse
  const response = await prisma?.evaluationFormUserResponse.create({
    data: {
      answer: questionResponse,
      question: questionId,
      uid,
    },
  })

  return NextResponse.json({ response })
}

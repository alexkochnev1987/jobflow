import prisma from "@/lib/prisma"
import { NextRequest, NextResponse } from "next/server"
export async function GET(request: Request) {}
export async function POST(request: NextRequest) {
  const { uid, questionResponse, questionId } = await request.json()
  // save response
  // get default UserResponses or create it
  const userResponse = await prisma?.userResponses.upsert({
    where: {
      uid,
    },
    create: {
      uid,
    },
    update: {},
  })
  const saveResponse = await prisma?.questionResponse.create({
    data: {
      response: `${questionResponse}`,
      questionId,
      responseId: userResponse.id,
    },
  })
  // save QuestionResponse
  console.log({
    uid,
    saveResponse,
  })
  return NextResponse.json({ saveResponse })
}

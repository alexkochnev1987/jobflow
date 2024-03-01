import { Quizzes } from '@prisma/client'
import 'server-only'

export async function getQuizByID(id: string) {
  return prisma?.quizzes.findUniqueOrThrow({
    where: {
      id: parseInt(id, 10),
      status: "published",
    },
    select: {
      id: true,
      name: true,
      image: true,
      content: true,
      type: true
    }
  })
}

export async function getQuizzResources(quizId: number) {
  return prisma?.quizzResource.findMany({
    where: {
      quizzesId: quizId,
      status: "published",
    },
    select: {
      id: true,
      file: true,
      description: true
    }
  })
}
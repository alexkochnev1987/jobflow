"use server"

export async function getQuestions(category: string) {
  const res = await prisma?.question.findMany({
    where: {
      category,
    },
  })

  return res
}

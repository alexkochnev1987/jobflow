"use server"

export async function getQuestions(category: string) {
  const res = await prisma?.question.findMany({
    where: {
      category,
    },
  })

  return res
}

export async function getCareers() {
  const res = await prisma?.careers.findMany({})

  return res
}

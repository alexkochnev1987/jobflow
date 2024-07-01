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
      type: true,
      description: true,
      file: true,
      file_description: true,
      file_name: true
    }
  })
}

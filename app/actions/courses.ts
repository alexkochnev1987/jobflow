export async function getCoursesByCompanyId(id: number) {
  return prisma?.courses.findMany({
    where: {
      company: id,
    },
  })
}

export async function getCourseById(id: number) {
  return prisma?.courses.findUnique({
    where: {
      id: parseInt(id.toString(), 10),
    },
  })
}

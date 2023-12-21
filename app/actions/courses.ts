export async function getCoursesByCompanyId(id: number) {
  return prisma?.courses.findMany({
    where: {
      company: id
    },
  })
}
export async function getCoursesByCompanyId(id: number) {
  return prisma?.courses.findMany({
    where: {
      company: id,
      status: "published",
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

export async function unpublishCourse(id: number) {
  return prisma?.courses.update({
    where: {
      id: parseInt(id.toString(), 10),
    },
    data: {
      status: "draft",
    },
  })
}

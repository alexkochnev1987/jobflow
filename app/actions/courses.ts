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
    select: {
      name: true,
      description: true,
      sponsonrship: true,
      price: true,
      location: true,
      start_date: true,
      course_type: true,
      pace: true,
      image: true,
      Company: {
        select: {
          id: true,
          name: true,
          logo: true,
        },
      },
      Careers_Courses: {
        select: {
          careers: {
            select: {
              id: true,
              name: true,
            },
          },
        },
      },
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

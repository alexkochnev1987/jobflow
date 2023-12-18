"use server"
import prisma from "lib/prisma"

export async function getCareers() {
  const res = await prisma?.careers.findMany({
    where: {
      status: "published",
    },
  })

  return res
}

export async function getCareer(id: string) {
  return prisma?.careers.findUnique({
    where: {
      id,
    },
    select: {
      id: true,
      name: true,
      salaryMin: true,
      salaryMax: true,
      pace: true,
      format: true,
      image: true,
      description: true,
      detailsFuture: true,
      detailsRequirement: true,
      detailsSkills: true,
      detailsTasks: true,
      retrainingWeeks: true,
      Careers_Courses: {
        select: {
          courses: {
            select: {
              id: true,
              location: true,
              name: true,
              pace: true,
              price: true,
            },
          },
        },
      },
    },
  })
}

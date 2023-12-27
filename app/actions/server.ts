"use server"
import prisma from "lib/prisma"

export async function getCareers() {
  return prisma?.careers.findMany({
    where: {
      status: "published",
    },
  })

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
              start_date: true,
              description: true,
              image: true,
              sponsonrship: true,
            },
          },
        },
      },
    },
  })
}

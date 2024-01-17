import "server-only"
import prisma from "lib/prisma"

export async function getCareers() {
  return prisma?.careers.findMany({
    where: {
      status: "published",
    }, select: {
      id: true,
      name: true,
      description: true,
      detailsFuture: true,
      detailsRequirement: true,
      detailsSkills: true,
      detailsTasks: true,
      image: true,
      retrainingWeeks: true,
      salaryMax: true,
      salaryMin: true,
      Careers_Courses: {
        select: {
          courses: {
            where: {
              status: "published",
            },
            select: {
              id: true,
              pace: true,
              location: true,
            }
          }
        }
      }
    }
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
      image: true,
      description: true,
      detailsFuture: true,
      detailsRequirement: true,
      detailsSkills: true,
      detailsTasks: true,
      retrainingWeeks: true,
      Careers_Quizzes: {
        select: {
          Quizzes: {
            select: {
              id: true,
              name: true,
              description: true,
              duration: true,
            },
          },
        },
      },
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
              Company: {
                select: {
                  logo: true,
                  name: true,
                  id: true,
                  Contact: {
                    select: {
                      id: true,
                      avatar: true,
                      first_name: true,
                      last_name: true,
                    },
                  },
                },
              },
            },
          },
        },
      },
    },
  })
}

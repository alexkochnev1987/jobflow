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
  const res = await prisma?.careers.findFirst({
    where: {
      status: "published",
      id,
    },
  })

  return res
}

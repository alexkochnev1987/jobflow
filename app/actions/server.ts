"use server"
import prisma from "lib/prisma"

export async function getCareers() {
  const res = await prisma?.careers.findMany({})

  return res
}

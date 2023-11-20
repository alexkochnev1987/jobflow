"use server"

export * from "./form-evaluation"

export async function getCareers() {
  const res = await prisma?.careers.findMany({})

  return res
}

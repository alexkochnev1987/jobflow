"use server"


export async function getCareers() {
  const res = await prisma?.careers.findMany({})

  return res
}

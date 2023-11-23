"use server"

import { userPersonalitySelect } from "./user-personality"

export async function getUserProfileById(id: string) {
  return prisma?.profile.findFirst({
    where: {
      id,
    },
    select: {
      userPersonality: {
        select: userPersonalitySelect,
      },
    },
  })
}

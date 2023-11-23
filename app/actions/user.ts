"use server"

import { userPersonalitySelect } from "./user-personality"

const profileSelect = {
  select: {
    userPersonality: {
      select: userPersonalitySelect,
    },
  },
}

export async function getUserById(id: string) {
  return prisma?.user.findFirst({
    where: {
      id,
    },
    select: {
      Profile: profileSelect,
    },
  })
}

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

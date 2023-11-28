"use server"
import prisma from "lib/prisma"
const tagsSelect = {
  select: {
    tags: {
      select: {
        name: true,
      },
    },
  },
}

const userPersonalitySelect = {
  name: true,
  you_at_work: true,
  strengths_summary: true,
  sort: true,
  strengths: tagsSelect,
  weaknesses: tagsSelect,
  ideal_work_environment: tagsSelect,
  communications_skills: true,
  leadership: true,
  teamwork: true,
}

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

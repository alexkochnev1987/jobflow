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

export async function getUserByEmail(email: string) {
  return prisma?.user.findFirst({
    where: {
      email,
    },
    select: {
      id: true,
      email: true,
      profileId: true,
      evaluationCompleted: true,
      Profile: profileSelect,
    },
  })
}

export async function hasCompletedEvaluation(email: string) {
  const res = await prisma?.user.findFirst({
    where: {
      email,
    },
    select: {
      evaluationCompleted: true,
    },
  })

  return res.evaluationCompleted
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

export async function getUserContactById(userId: string) {
  return prisma?.contact.findFirst({
    where: {
      userId,
    },
  })
}

export async function getUserCompanyById(userId: string) {
  const contact = await getUserContactById(userId)
  return prisma?.companies.findFirst({
    where: {
      id: contact?.company_id,
    },
  })
}

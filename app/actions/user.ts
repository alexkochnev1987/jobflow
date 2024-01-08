"use server"
import "server-only"

import { hash } from "bcryptjs"
import prisma from "lib/prisma"
import { auth } from "auth"
import { sendEmail } from "@/lib/email"
import { componentToHTML } from "@/lib/utils"
import { Template as AccountDeletionEmail } from "@/emails/account-deletion"
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

export async function createUser(
  name: string,
  email: string,
  password: string,
) {
  const hashed_password = await hash(password, 12)

  return prisma.user.upsert({
    where: {
      email,
    },
    update: { password: hashed_password },
    create: {
      name,
      email: email.toLowerCase(),
      password: hashed_password,
    },
  })
}

export async function upgradeUser(email: string) {
  return prisma?.user.update({
    where: {
      email: email.toLowerCase(),
    },
    data: {
      premium: true,
    },
  })
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
  return prisma?.companies.findUnique({
    where: {
      id: contact?.company_id,
    },
  })
}

export async function isCompanyUser(email: string) {
  const user = await getUserByEmail(email)
  const contact = await getUserContactById(user.id)
  if (!contact) {
    return false
  }
  return true
}

export async function updatePassword(password: string) {
  const session = await auth()
  const hashed_password = await hash(password, 12)

  return prisma?.user.update({
    where: {
      email: session.user.email,
    },
    data: {
      password: hashed_password,
    },
  })
}

export async function deleteUser() {
  const session = await auth()
  console.log(session)

  const user = await getUserByEmail(session.user.email)

  if (!user) {
    return
  }

  // delete profile
  await prisma?.profile.deleteMany({
    where: {
      userId: user.id,
    },
  })

  // delete accounts
  await prisma?.account.deleteMany({
    where: {
      userId: user.id,
    },
  })

  // delete user
  await prisma?.user.delete({
    where: {
      email: session.user.email,
    },
  })

  // send email
  await sendEmail({
    to: session.user.email,
    subject: "Account gelöscht 😢",
    html: await componentToHTML(AccountDeletionEmail()),
  })
}

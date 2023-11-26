"use server"

const tagsSelect = {
  select: {
    tags: {
      select: {
        name: true,
      },
    },
  },
}

export const userPersonalitySelect = {
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

export async function getUserPersonalities() {
  return prisma?.userPersonality.findMany({
    where: {
      status: "published",
    },
    orderBy: {
      sort: "asc",
    },
  })
}

export async function getUserPersonalityByName(name: string) {
  return prisma?.userPersonality.findFirst({
    where: {
      status: "published",
      name,
    },
    select: userPersonalitySelect,
  })
}

export async function getUserPersonalityById(id: string) {
  return prisma?.userPersonality.findFirst({
    where: {
      status: "published",
      id,
    },
    select: userPersonalitySelect,
  })
}

export async function getUserPersonalityResponsesByUID(uid: string) {
  return prisma?.evaluationFormUserResponse.findMany({
    where: {
      AND: [
        {
          uid,
        },
        {
          AND: [
            {
              EvaluationFormQuestion: {
                type: "mbti",
              },
            },
            {
              EvaluationFormQuestion: {
                status: "published",
              },
            },
          ],
        },
      ],
    },
    select: {
      id: true,
      answer: true,
      EvaluationFormQuestion: {
        select: {
          id: true,
          question: true,
          sort: true,
          EvaluationFormAnswer: {
            select: {
              id: true,
              label: true,
              letter: true,
              value: true,
            },
          },
        },
      },
    },
  })
}

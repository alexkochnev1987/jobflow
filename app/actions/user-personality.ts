import 'server-only'
import prisma from "lib/prisma"
import {
  EvaluationFormAnswer,
  EvaluationFormQuestion,
  EvaluationFormUserResponse,
} from "@prisma/client"

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
  id: true,
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

type EvaluationFormQuestionWithAnswers = {
  EvaluationFormQuestion: {
      EvaluationFormAnswer: {
          id: number;
          value: string | null;
          label: string | null;
          letter: string | null;
      }[];
      id: number;
      question: string | null;
      sort: number | null;
  } | null;
  id: number;
  answer: string | null;
};
export async function getUserPersonalityResponsesByUID(uid: string): Promise<EvaluationFormQuestionWithAnswers[]> {
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

/**
 * Returns the MBTI answer based on the user's response
 * @param mbtiUserResponse 
 * @returns 
 */
function getMBTIAnswer(
  mbtiUserResponse: EvaluationFormQuestionWithAnswers,
): Partial<EvaluationFormAnswer> | undefined {
  const mbtiQuestion = mbtiUserResponse.EvaluationFormQuestion

  if(!mbtiQuestion) {
    return undefined;
  }
  const mbtiAnswer = mbtiQuestion.EvaluationFormAnswer.find(
    (answer) =>
      answer?.value?.toLowerCase() === mbtiUserResponse.answer?.toLowerCase(),
  )
  return mbtiAnswer
}

/**
 * Calculates the MBTI based on the user's responses
 * @param uid
 * @returns `string` - the MBTI
 */
export async function calculateMBTI(uid: string) {
  const userResponses = await getUserPersonalityResponsesByUID(uid)
  const answers = userResponses.map(x => getMBTIAnswer(x))

  // each answer has a letter, so we need to group them by letter
  const groupedAnswers = answers.reduce((acc, answer) => {
    if (!answer) return acc
    const { letter } = answer
    if (!letter) return acc
    if (!acc[letter]) acc[letter] = 0
    acc[letter] += 1
    return acc
  }, {} as Record<string, number>)

  const firstLetter = groupedAnswers.E > groupedAnswers.I ? "E" : "I"
  const secondLetter = groupedAnswers.S > groupedAnswers.N ? "S" : "N"
  const thirdLetter = groupedAnswers.T > groupedAnswers.F ? "T" : "F"
  const fourthLetter = groupedAnswers.J > groupedAnswers.P ? "J" : "P"

  return `${firstLetter}${secondLetter}${thirdLetter}${fourthLetter}`
}

"use server"

const evaluationFormQuestionSelect = {
  sort: true,
  question: true,
  type: true,
  EvaluationFormAnswer: {
    select: {
      sort: true,
      value: true,
    },
    where: {
      status: "published",
    },
  },
}

const evaluationFormStepSelect = {
  sort: true,
  title: true,
  description: true,
  EvaluationFormQuestion: {
    select: evaluationFormQuestionSelect,
    where: {
      status: "published",
    },
  },
}

export async function getEvaluationFormSteps() {
  return prisma?.evaluationFormStep.findMany({
    where: {
      status: "published",
    },
    select: evaluationFormStepSelect,
    orderBy: {
      sort: "asc",
    },
  })
}

export async function getEvaluationFormStepsCount() {
  return prisma?.evaluationFormStep.count({
    where: {
      status: "published",
    },
  })
}

export async function getEvaluationFormStep(id: number) {
  return prisma?.evaluationFormStep.findFirst({
    where: {
      id,
    },
    select: evaluationFormStepSelect,
  })
}

export async function getEvaluationFormQuestions(step: number) {
  return prisma?.evaluationFormQuestion.findMany({
    where: {
      status: "published",
      step,
    },
    select: evaluationFormQuestionSelect,
    orderBy: {
      sort: "asc",
    },
  })
}

export async function getEvaluationFormAnswers(questionId: number) {
  return prisma?.evaluationFormAnswer.findMany({
    where: {
      status: "published",
      question: questionId,
    },
    select: {
      sort: true,
      value: true,
    },
    orderBy: {
      sort: "asc",
    },
  })
}

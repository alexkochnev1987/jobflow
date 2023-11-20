export async function getEvaluationFormSteps() {
  return prisma?.evaluationFormStep.findMany({
    where: {
      status: "published",
    },
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
    }
  })
}

export async function getEvaluationFormQuestions(step: number) {
  return prisma?.evaluationFormQuestion.findMany({
    where: {
      status: "published",
      step,
    },
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
    orderBy: {
      sort: "asc",
    },
  })
}

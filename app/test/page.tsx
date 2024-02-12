"use server"

import {
  getEvaluationFormQuestions,
  getEvaluationFormSteps,
} from "../actions/form-evaluation"
import { redirect } from "next/navigation"
import Form from "@/components/shared/form-evaluation"
import { ROUTES } from "@/lib/constants"
import { hasCompletedEvaluation } from "../actions/user"
import l18n from "../../i18n/config"
import { auth } from "auth"

export default async function Home({
  searchParams,
}: {
  params: { slug: string }
  searchParams: { [key: string]: string | string[] | undefined }
}) {
  const session = await auth()
  const evaluationCompleted = await hasCompletedEvaluation(session?.user?.email)

  if (session?.user && evaluationCompleted) {
    return redirect(ROUTES.DashBoard)
  }

  const stepSort = parseInt(searchParams.step?.toString()) || 1

  const steps = await getEvaluationFormSteps()

  const step = stepSort ? steps.find((s) => s.sort === stepSort) : steps[0]

  if (stepSort > 1 && !step) {
    return redirect(ROUTES.EvaluationResults)
  }

  const questions = await getEvaluationFormQuestions(step.id)

  console.log({
    step,
    stepSort,
  })

  return (
    <Form
      stepSort={step.sort}
      questions={questions}
      title={step.title}
      description={step.description}
    />
  )
}

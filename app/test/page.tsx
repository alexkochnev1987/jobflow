"use server"

import {
  getEvaluationFormQuestions,
  getEvaluationFormSteps,
} from "../actions/form-evaluation"
import { redirect } from "next/navigation"
import { getServerSession } from "next-auth"
import Form from "@/components/shared/form-evaluation"
import { ROUTES } from "@/lib/constants"
import { hasCompletedEvaluation } from "../actions/user"
import l18n from "../../i18n/config"
import { authOptions } from "../api/auth/[...nextauth]/route"

export default async function Home({
  searchParams,
}: {
  params: { slug: string }
  searchParams: { [key: string]: string | string[] | undefined }
}) {
  const session = await getServerSession(authOptions)
  const evaluationCompleted = await hasCompletedEvaluation(session?.user?.email)

  if (session?.user && evaluationCompleted) {
    return redirect(ROUTES.DashBoard)
  }

  const stepId = parseInt(searchParams.step?.toString()) || null


  const steps = await getEvaluationFormSteps()

  const step = stepId ? steps.find((s) => s.id === stepId) : steps[0]

  if (stepId > 1 && !step) {
    return redirect(ROUTES.EvaluationResults)
  }

  const questions = await getEvaluationFormQuestions(step.id)


  console.log({
    step,
    stepId,
  })

  return (
    <Form
      step={step.id}
      questions={questions}
      title={l18n.t(step.title)}
      description={l18n.t(step.description)}
    />
  )
}

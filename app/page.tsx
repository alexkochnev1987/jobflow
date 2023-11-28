"use server"
import { QUESTION_CATEGORIES } from "@/lib/constants"
import {
  getEvaluationFormQuestions,
  getEvaluationFormStep,
  getEvaluationFormSteps,
  getEvaluationFormStepsCount,
} from "./actions/form-evaluation"
import { redirect, useRouter } from "next/navigation"
import { getServerSession } from "next-auth"
import t from "../i18n/config"
import Form from "@/components/shared/form-evaluation"

export default async function Home({
  searchParams,
}: {
  params: { slug: string }
  searchParams: { [key: string]: string | string[] | undefined }
}) {
  const session = await getServerSession()
  if (session?.user) {
    return redirect("/profile")
  }

  const stepId = parseInt(searchParams.step?.toString()) || null

  // todo get FormEvaluation from server

  const steps = await getEvaluationFormSteps()

  const step = stepId ? steps.find((s) => s.id === stepId) : steps[0]

  if (stepId > 1 && !step) {
    return redirect("/results")
  }

  const questions = await getEvaluationFormQuestions(step.id)

  const progress = Math.round((step.id / steps.length) * 100)

  console.log({
    step,
  })

  return (
    <Form
      step={step.id}
      questions={questions}
      title={t(step.title)}
      progress={progress}
      description={t(step.description)}
    />
  )
}

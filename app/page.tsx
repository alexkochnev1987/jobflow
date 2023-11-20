import { QUESTION_CATEGORIES } from "@/lib/constants"
import {
  getEvaluationFormQuestions,
  getEvaluationFormStep,
  getEvaluationFormSteps,
  getEvaluationFormStepsCount,
} from "./actions/form-evaluation"
import Form from "@/components/shared/question"
import { redirect, useRouter } from "next/navigation"
import { getServerSession } from "next-auth"
import t from "../i18n/config"

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

  const step = steps.find((s) => s.id === stepId) || steps[0]

  const questions = await getEvaluationFormQuestions(step.id)

  console.log({
    step,
    questions,
  })

  return (
    <>
      <div className="z-10 w-full max-w-3xl">
        <Form
          step={step.id}
          questions={questions}
          title={t(step.title)}
          progress={40}
          description={t(step.description)}
        />
      </div>
    </>
  )
}

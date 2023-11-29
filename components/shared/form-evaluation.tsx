"use client"
import { Progress } from "../ui/progress"
import { userStore } from "@/app/client/store"
import { useEffect, useState } from "react"
import { redirect, useRouter } from "next/navigation"
import { Button } from "@radix-ui/themes"
import "../../i18n/config-client"
import { useTranslation } from "react-i18next"
import { EvaluationFormQuestion } from "@prisma/client"
import { RenderQuestion } from "../evaluation/questions"
import Sparckle from "@/components/shared/icons/sparckle.svg"
import { cn } from "@/lib/utils"
import { ProgressIndicator } from "@radix-ui/react-progress"

type FormProps = {
  title: string
  description: string
  questions: Partial<EvaluationFormQuestion>[]
  progress: number
  step: number
}

export default function Form({
  title,
  description,
  questions,
  progress,
  step,
}: FormProps): JSX.Element {
  const [errors, setErrors] = useState({})
  const [showQuestions, setShowQuestions] = useState(false)
  const [unAnsweredQuestions, setUnAnsweredQuestions] = useState([])
  const store = userStore()
  const router = useRouter()
  const { t } = useTranslation()
  const elRefs = {}

  useEffect(() => {
    setErrors({})
  }, [step])

  useEffect(() => {
    setUnAnsweredQuestions(questions.filter((q) => !store.findResponse(q.id)))
  }, [questions, store])

  const newStep = (newStep) => {
    store.setStep(newStep)
    router.push(`/?step=${newStep}`)
  }

  const prevStep = () => {
    const prevStep = Math.max(step - 1, 1)
    newStep(prevStep)
  }

  const nextStep = () => {
    const localErrors = {}
    for (const key of Object.keys(elRefs)) {
      const el = elRefs[key]
      if (!el?.current?.value || el?.current?.value === "") {
        localErrors[key] = "Required"
      }
    }
    setErrors(localErrors)
    if (hasErrors(localErrors)) {
      return
    }
    const nextStep = step + 1
    newStep(nextStep)
  }

  const hasErrors = (errors) => Object.keys(errors).length > 0

  const question = unAnsweredQuestions[0]

  // calculate progress
  // based on the number of questions
  // and unaswered questions
  const progess = 100 - (unAnsweredQuestions.length / questions.length) * 100

  return (
    <div
      className={cn(
        "min-h-full w-full flex-col justify-center ",
        !showQuestions && "bg-sky-100",
      )}
    >
      {showQuestions && <Progress value={progess} />}
      <div className="z-10 mx-auto px-10 py-10 md:w-1/2 lg:w-1/3">
        {!showQuestions && (
          <>
            <div className="flex-col justify-start gap-8">
              <div className="mb-10 flex h-8 w-full flex-row align-middle">
                <Sparckle />
                <h1 className="mx-3 my-auto text-sm font-medium uppercase text-sky-500">
                  {title}
                </h1>
              </div>
              <div className="self-stretch text-lg font-normal leading-7 text-black">
                {description}
              </div>
            </div>
            <Button
              className="!my-10 w-full text-center text-lg font-normal normal-case leading-7 text-black"
              size="4"
              color="indigo"
              radius="large"
              onClick={() => setShowQuestions(true)}
            >
              {t("Continue")}
            </Button>
          </>
        )}

        {showQuestions && (
          <>
            {question ? (
              <RenderQuestion
                key={question.id}
                question={question}
                inputRef={elRefs}
                error={errors[question.id]}
              />
            ) : (
              <Button
                className="my-10 w-full text-center text-lg font-normal normal-case leading-7 text-black"
                size="4"
                color="indigo"
                radius="large"
                onClick={() => nextStep()}
              >
                {t("Continue")}
              </Button>
            )}
          </>
        )}

        {hasErrors(errors) && (
          <p className="w-full flex-1 text-destructive">{t("FORM_ERRORS")}</p>
        )}
      </div>
    </div>
  )
}

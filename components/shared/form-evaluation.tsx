"use client"
import { Progress } from "../ui/progress"
import { userStore } from "@/app/client/store"
import { useEffect, useState } from "react"
import { redirect, useRouter } from "next/navigation"
import "../../i18n/config-client"
import { useTranslation } from "react-i18next"
import { EvaluationFormQuestion } from "@prisma/client"
import { RenderQuestion } from "../evaluation/questions"
import Sparckle from "@/icons/sparckle.svg"
import { cn } from "@/lib/utils"
import { ROUTES } from "@/lib/constants"
import Button from "./button"


type FormProps = {
  title: string
  description: string
  questions: Partial<EvaluationFormQuestion>[]
  step: number
}

export default function Form({
  title,
  description,
  questions,
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

  const percentAnswered =
    ((questions.length - unAnsweredQuestions.length) / questions.length) * 100

  console.log(percentAnswered, unAnsweredQuestions.length, questions.length)

  const newStep = (newStep) => {
    store.setStep(newStep)
    router.push(`${ROUTES.Evaluation}?step=${newStep}`)
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

  return (
    <div
      className={cn(
        "min-h-full w-full flex-col justify-center ",
        !showQuestions && "bg-sky-100",
      )}
    >
      {showQuestions && <Progress value={percentAnswered} />}
      <div className="z-10 mx-auto px-10 py-10 md:w-1/2 lg:w-1/2">
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
              onClick={() => setShowQuestions(true)}
              intent="primary"
              size="medium"
            >
              {t("Continue")}
            </Button>
            {/* <button
              className="!my-10 w-full rounded-lg bg-sky-500 py-3 text-center text-lg font-normal normal-case leading-7 text-white "
              color="indigo"
              onClick={() => setShowQuestions(true)}
            >
              {t("Continue")}
            </button> */}
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
              <Button onClick={() => nextStep()} intent="primary" size="medium">
                {t("Get your results")}
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

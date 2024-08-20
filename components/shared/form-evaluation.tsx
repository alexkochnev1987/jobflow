"use client"
import { Progress } from "../ui/progress"
import { userStore } from "@/app/client/store"
import { useEffect, useMemo, useState } from "react"
import { useRouter } from "next/navigation"
import { EvaluationFormQuestion } from "@prisma/client"
import { RenderQuestion } from "../evaluation/questions"
import Sparckle from "@/icons/sparckle.svg"
import { cn } from "@/lib/utils"
import { ROUTES } from "@/lib/constants"
import { Button } from "@radix-ui/themes"
import l18n from "../../i18n/config"
import { Skeleton } from "../ui/skeleton"

type FormProps = {
  title: string
  description: string
  questions: Partial<EvaluationFormQuestion>[]
  stepSort: number
}

const hasErrors = (errors) => Object.keys(errors).length > 0

export default function Form({
  title,
  description,
  questions,
  stepSort,
}: FormProps): JSX.Element {
  const [errors, setErrors] = useState({})
  const [showQuestions, setShowQuestions] = useState(false)
  const store = userStore()
  const router = useRouter()
  const elRefs = useMemo(() => ({}), [])

  useEffect(() => {
    store.totalQuestions = questions.length
  }, [questions, store])

  useEffect(() => {
    setErrors({})
    setShowQuestions(false)
  }, [stepSort])

  const percentAnswered =
    (questions.reduce((acc, q) => {
      const response = store.findResponse(q.id)
      return response ? acc + 1 : acc
    }, 0) *
      100) /
    questions.length

  const newStep = (newStep) => {
    store.setStep(newStep)
    router.push(`${ROUTES.Evaluation}?step=${newStep}`)
  }

  const prevStep = () => {
    const prevStep = Math.max(stepSort - 1, 1)
    newStep(prevStep)
  }

  const nextStep = () => {
    const localErrors = {}
    for (const key of Object.keys(elRefs)) {
      const el = elRefs[key]
      if (!el?.current?.value || el?.current?.value === "") {
        localErrors[key] = l18n.t("Required")
      }
    }
    setErrors(localErrors)
    if (hasErrors(localErrors)) {
      return
    }
    const nextStep = stepSort + 1
    newStep(nextStep)
  }

  const question = questions.find((q) => !store.findResponse(q.id))

  useEffect(() => {
    if (percentAnswered === 100) {
      nextStep()
    }
  }, [percentAnswered])

  return (
    <div
      className={cn(
        "min-h-full w-full flex-col justify-center ",
        !showQuestions && "bg-lightBlue pb-4",
      )}
    >
      {showQuestions && <Progress value={percentAnswered} />}
      <div className="z-10 mx-auto max-w-lg px-2 pt-12">
        {!showQuestions && (
          <>
            <div className="flex-col justify-start gap-8">
              <div className="mb-10 flex h-8 w-full flex-row align-middle">
                <Sparckle />
                <h1
                  className="mx-3 my-auto text-sm font-medium uppercase text-lightGreen"
                  dangerouslySetInnerHTML={{
                    __html: title,
                  }}
                ></h1>
              </div>
              <div
                className="self-stretch text-lg font-normal leading-7 text-black"
                dangerouslySetInnerHTML={{
                  __html: description,
                }}
              ></div>
            </div>
            <Button
              onClick={() => setShowQuestions(true)}
              size="4"
              variant="solid"
              className="mt-10 w-full !bg-magenta"
            >
              {l18n.t("test.button.start", "Continue")}
            </Button>
          </>
        )}

        {showQuestions && (
          <>
            {
              question ? (
                <RenderQuestion
                  key={question.id}
                  question={question}
                  inputRef={elRefs}
                  error={errors[question.id]}
                />
              ) : (
                <Skeleton className="h-[20px] w-full rounded-full" />
              )
              // <Button
              //   onClick={() => nextStep()}
              //   size="4"
              //   variant="solid"
              //   className="mt-10 w-full !bg-magenta"
              // >
              //   {l18n.t("test.result.cta", "Get your results")}
              // </Button>
            }
          </>
        )}

        {hasErrors(errors) && (
          <p className="w-full flex-1 text-destructive">
            {l18n.t("FORM_ERRORS")}
          </p>
        )}
      </div>
    </div>
  )
}

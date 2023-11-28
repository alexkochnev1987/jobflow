"use client"
import { Progress } from "../ui/progress"
import {
  Card,
  CardContent,
  CardDescription,
  CardFooter,
  CardHeader,
  CardTitle,
} from "../ui/card"
import { userStore } from "@/app/client/store"
import { useEffect, useState } from "react"
import { useRouter } from "next/navigation"
import { Button } from "@radix-ui/themes"
import "../../i18n/config-client"
import { useTranslation } from "react-i18next"
import { EvaluationFormQuestion } from "@prisma/client"
import { RenderQuestion } from "../evaluation/questions"
import Sparckle from "@/components/shared/icons/sparckle.svg"

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
  const store = userStore()
  const router = useRouter()
  const { t } = useTranslation()

  const elRefs = {}
  useEffect(() => {
    setErrors({})
  }, [step])

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

  //  className="bg-sky-100"
  return (
    <div className=" w-full flex-col justify-center bg-sky-100">
      <div className="z-10 mx-auto px-10 py-10 md:w-1/2 lg:w-1/3">
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
          className="my-10 w-full text-center text-lg font-normal normal-case leading-7 text-black"
          size="4"
          color="indigo"
          radius="large"
        >
          {t("Continue")}
        </Button>

        {questions?.map((q) => (
          <RenderQuestion
            key={q.id}
            question={q}
            inputRef={elRefs}
            error={errors[q.id]}
          />
        ))}
        {hasErrors(errors) && (
          <p className="w-full flex-1 text-destructive">{t("FORM_ERRORS")}</p>
        )}
        {step > 1 && (
          <Button
            variant="outline"
            size="4"
            onClick={() => prevStep()}
            className="w-48"
          >
            {t("Zurück")}
          </Button>
        )}
        <Button
          size="4"
          onClick={() => nextStep()}
          radius="large"
          className="w-48"
        >
          {t("Weiter")}
        </Button>
      </div>
    </div>
  )
}

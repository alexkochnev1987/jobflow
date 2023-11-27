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

  return (
    <>
      <Card className="border-0">
        <CardHeader>
          <CardTitle>
            <div className="relative w-full">
              <p className="absolute right-0 top-[-25px] z-10 text-sm font-normal">
                <span className="text-primary">
                  {t("Schritt", {
                    count: step,
                  })}
                </span>{" "}
                {t("von", {
                  count: 5,
                })}
              </p>
              <Progress value={progress} className="border-0" />
            </div>
            <br />
            {title}
          </CardTitle>
          <CardDescription>{description}</CardDescription>
        </CardHeader>
        <CardContent className="flex flex-col gap-3">
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
        </CardContent>
        <CardFooter className="flex flex-row justify-center gap-3">
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
        </CardFooter>
      </Card>
    </>
  )
}


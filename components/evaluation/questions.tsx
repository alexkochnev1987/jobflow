"use client"
import { Label } from "../ui/label"
import { Textarea } from "../ui/textarea"
import { Slider } from "../ui/slider"
import { Skeleton } from "../ui/skeleton"
import { RadioGroup, RadioGroupItem } from "../ui/radio-group"
import { QUESTION_TYPES } from "@/lib/constants"
import { userStore } from "@/app/client/store"
import { useEffect, useRef, useState } from "react"
import { cn } from "@/lib/utils"
import { useTranslation } from "react-i18next"
import { Button } from "@radix-ui/themes"
import { EvaluationFormAnswer, EvaluationFormQuestion } from "@prisma/client"

export function RenderQuestion({ question, inputRef, error }) {
  inputRef[question.id] = useRef()
  switch (question.type) {
    case QUESTION_TYPES.Range:
      return (
        <SliderQuestion
          question={question as EvaluationFormQuestion}
          max={5}
          id={question.id}
          inputRef={inputRef[question.id]}
        />
      )
    case QUESTION_TYPES.Checkbox:
      return (
        <YesNoQuestion
          {...question}
          inputRef={inputRef[question.id]}
          error={error}
        />
      )
    case QUESTION_TYPES.Button:
    case QUESTION_TYPES.MBTI:
      return (
        <ButtonQuestion
          question={question as EvaluationFormQuestion}
          anwsers={question.EvaluationFormAnswer as EvaluationFormAnswer[]}
          inputRef={inputRef[question.id]}
          id={question.id}
          error={error}
        />
      )
    case QUESTION_TYPES.Text:
    default:
      return (
        <TextQuestion
          {...question}
          inputRef={inputRef[question.id]}
          error={error}
        />
      )
  }
}

function ButtonQuestion({ question, anwsers, id, inputRef, error }) {
  const store = userStore()
  const [value, setValue] = useState("")
  const [isLoading, setIsLoading] = useState(true)
  const { t } = useTranslation()

  useEffect(() => {
    const hasResponse = store.findResponse(id)
    if (hasResponse) {
      setValue(hasResponse.response as string)
    }
    setIsLoading(false)
  }, [store, id])

  useEffect(() => {

    const hasResponse = store.findResponse(id)
    if (hasResponse) {
      inputRef.current = {
        value: hasResponse.response as string,
      }
    }


  }, [id, inputRef, store])

  function handleAnswer(answer: EvaluationFormAnswer) {
    setValue(answer.value)
    store.save(id, answer.value)
    inputRef.current = {
      value: answer.value,
    }
  }

  if (isLoading) {
    return <LoadingQuestion />
  }
  return (
    <div className="py-3">
      <Label htmlFor={id} className={cn(error && "text-destructive")}>
        {t(question.question)}
      </Label>
      <div className="flex flex-row justify-center py-3">
        {anwsers?.map((answer: EvaluationFormAnswer) => (
          <Button
            key={answer.label}
            className="mr-2 w-1/2 py-10 text-center normal-case"
            size="4"
            color={
              answer.value === inputRef?.current?.value ||
              answer.value === value
                ? "cyan"
                : "indigo"
            }
            onClick={() => handleAnswer(answer)}
          >
            {t(answer.label)}
          </Button>
        ))}
      </div>
    </div>
  )
}
function TextQuestion({ question, id, inputRef, error }) {
  const store = userStore()
  const [value, setValue] = useState("")
  const [isLoading, setIsLoading] = useState(true)
  const { t } = useTranslation()

  useEffect(() => {
    const hasResponse = store.findResponse(id)
    if (hasResponse) {
      setValue(hasResponse.response as string)
    }
    setIsLoading(false)
  }, [store, id])

  if (isLoading) {
    return <LoadingQuestion />
  }
  return (
    <div className="py-3">
      <Label htmlFor={id} className={cn(error && "text-destructive")}>
        {t(question)}
      </Label>
      <Textarea
        placeholder={t("Deine Antwort")}
        id={id}
        value={value}
        onChange={(e) => setValue(e?.target?.value || "")}
        onBlur={() => store.save(id, value)}
        ref={inputRef}
      />
    </div>
  )
}

function YesNoQuestion({ question, id, inputRef, error }) {
  const store = userStore()
  const [value, setValue] = useState("nein")
  const [isLoading, setIsLoading] = useState(true)
  const { t } = useTranslation()

  useEffect(() => {
    const hasResponse = store.findResponse(id)
    if (hasResponse) {
      setValue(hasResponse.response as string)
    }
    inputRef.current = {
      value: 1,
    }
    setIsLoading(false)
  }, [store, id, inputRef])

  if (isLoading) {
    return <LoadingQuestion />
  }
  return (
    <div className="flex flex-row py-3">
      <Label htmlFor={id} className={cn("w-2/3", error && "text-destructive")}>
        {t(question)}
      </Label>
      <RadioGroup
        className="flex w-1/3 flex-row items-center justify-start  space-x-2"
        defaultValue={value}
        onValueChange={(e) => {
          setValue(e || "")
        }}
        onBlur={() => store.save(id, value)}
      >
        <div className="flex items-center justify-between space-x-2">
          <Label htmlFor="ja">{t("Ja")}</Label>
          <RadioGroupItem
            value={t("Ja")}
            id="ja"
            className="h-6 w-6 rounded-sm border-secondary"
          />
        </div>
        <div className="flex items-center space-x-2">
          <Label htmlFor="nein">{t("Nein")}</Label>
          <RadioGroupItem
            value={t("Nein")}
            id="nein"
            className="h-6 w-6 rounded-sm border-secondary"
          />
        </div>
      </RadioGroup>
    </div>
  )
}

function SliderQuestion({ question, id, max, inputRef }) {
  const store = userStore()
  const [value, setValue] = useState(2)
  const [isLoading, setIsLoading] = useState(true)
  const { t } = useTranslation()

  useEffect(() => {
    const hasResponse = store.findResponse(id)
    if (hasResponse) {
      setValue(hasResponse.response as number)
    }
    inputRef.current = {
      value: 1,
    }
    setIsLoading(false)
  }, [store, id, inputRef])

  if (isLoading) {
    return <LoadingQuestion />
  }
  return (
    <div className="py-5">
      <Label htmlFor={id} className="">
        {t(question.question)}
      </Label>
      <Slider
        defaultValue={[value]}
        max={max - 1}
        step={1}
        onValueChange={(v) => store.save(id, v[0])}
        className="py-5"
      />
    </div>
  )
}


function LoadingQuestion() {
  return (
    <>
      <Skeleton className="h-[20px] w-full rounded-full" />
    </>
  )
}

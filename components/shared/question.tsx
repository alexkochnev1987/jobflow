"use client"
import { Label } from "../ui/label"
import { Textarea } from "../ui/textarea"
import { Progress } from "../ui/progress"
import {
  Card,
  CardContent,
  CardDescription,
  CardFooter,
  CardHeader,
  CardTitle,
} from "../ui/card"
import { Slider } from "../ui/slider"
import { Skeleton } from "../ui/skeleton"
import { RadioGroup, RadioGroupItem } from "../ui/radio-group"
import { QUESTION_TYPES } from "@/lib/constants"
import { userStore } from "@/app/client/store"
import { useEffect, useRef, useState } from "react"
import { useRouter } from "next/navigation"
import { Button } from "@radix-ui/themes"
import { cn } from "@/lib/utils"

export default function Form({
  category,
  description,
  questions,
  progress,
  step,
}): JSX.Element {
  const [errors, setErrors] = useState({})
  const store = userStore()
  const router = useRouter()

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
    const nextStep = Math.min(step + 1, 5)
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
                <span className="text-primary">Schritt {step}</span> von 5
              </p>
              <Progress value={progress} className="border-0" />
            </div>
            <br />
            {category}
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
            <p className="w-full flex-1 text-destructive">
              Please fix the errors
            </p>
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
              Zurück
            </Button>
          )}
          <Button
            size="4"
            onClick={() => nextStep()}
            radius="large"
            className="w-48"
          >
            Weiter
          </Button>
        </CardFooter>
      </Card>
    </>
  )
}

function RenderQuestion({ question, inputRef, error }) {
  inputRef[question.id] = useRef()
  switch (question.type) {
    case QUESTION_TYPES.Slider:
      return <SliderQuestion {...question} inputRef={inputRef[question.id]} />
    case QUESTION_TYPES.YesNoCheckbox:
      return (
        <YesNoQuestion
          {...question}
          inputRef={inputRef[question.id]}
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

function TextQuestion({ question, id, inputRef, error }) {
  const store = userStore()
  const [value, setValue] = useState("")
  const [isLoading, setIsLoading] = useState(true)

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
        {question}
      </Label>
      <Textarea
        placeholder="Deine Antwort"
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
  const [value, setValue] = useState("")
  const [isLoading, setIsLoading] = useState(true)

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
        {question}
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
          <Label htmlFor="ja">Ja</Label>
          <RadioGroupItem
            value="ja"
            id="ja"
            className="h-6 w-6 rounded-sm border-secondary"
          />
        </div>
        <div className="flex items-center space-x-2">
          <Label htmlFor="nein">Nein</Label>
          <RadioGroupItem
            value="nein"
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
        {question}
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

function MultipleChoiceQuestion({ question, id }) {
  return (
    <>
      <Label htmlFor={id}>{question}</Label>
      <RadioGroup defaultValue="option-one" className="flex flex-row">
        <div className="flex items-center space-x-2">
          <RadioGroupItem value="option-one" id="option-one" />
          <Label htmlFor="option-one">Option One</Label>
        </div>
        <div className="flex items-center space-x-2">
          <RadioGroupItem value="option-two" id="option-two" />
          <Label htmlFor="option-two">Option Two</Label>
        </div>
      </RadioGroup>
    </>
  )
}

function LoadingQuestion() {
  return (
    <>
      <Skeleton className="h-[20px] w-full rounded-full" />
    </>
  )
}

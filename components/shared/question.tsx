"use client"
import { Button } from "../ui/button"
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
import { useEffect, useState } from "react"

export default function Form({
  category,
  description,
  questions,
  progress,
}): JSX.Element {
  return (
    <>
      <Card>
        <CardHeader>
          <CardTitle>
            <Progress value={progress} />
            <br />
            {category}
          </CardTitle>
          <CardDescription>{description}</CardDescription>
        </CardHeader>
        <CardContent className="flex flex-col gap-3">
          {questions?.map((q) => (
            <RenderQuestion key={q.id} question={q} />
          ))}
        </CardContent>
        <CardFooter className="flex flex-row justify-center gap-3">
          <Button variant="outline" size="lg">
            Zurück
          </Button>
          <Button size="lg">Weiter</Button>
        </CardFooter>
      </Card>
    </>
  )
}

function RenderQuestion({ question }) {
  switch (question.type) {
    case QUESTION_TYPES.Slider:
      return <SliderQuestion {...question} />
    case QUESTION_TYPES.Text:
    default:
      return <TextQuestion {...question} />
  }
}

function TextQuestion({ question, id }) {
  const store = userStore()
  const [value, setValue] = useState("")
  const [isLoading, setIsLoading] = useState(true)

  useEffect(() => {
    const hasResponse = store.findResponse(id)
    if (hasResponse) {
      setValue(hasResponse.response)
    }
    setIsLoading(false)
  }, [store, id])

  if (isLoading) {
    return <LoadingQuestion />
  }
  return (
    <>
      <Label htmlFor={id}>{question}</Label>
      <Textarea
        placeholder="Deine Antwort"
        id={id}
        value={value}
        onChange={(e) => setValue(e?.target?.value || "")}
        onBlur={() => store.save(id, value)}
      />
    </>
  )
}

function SliderQuestion({ question, id }) {
  return (
    <>
      <Label htmlFor={id}>{question}</Label>
      <Slider defaultValue={[2]} max={4} step={1} />
    </>
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

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

export default function Form({
  category,
  description,
  questions,
  progress
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
  return (
    <>
      <Label htmlFor={id}>{question}</Label>
      <Textarea placeholder="Deine Antwort" id={id} />
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

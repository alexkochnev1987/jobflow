"use client"
import { Label } from "../ui/label"
import { Textarea } from "../ui/textarea"
import { Slider } from "../ui/slider"
import { Skeleton } from "../ui/skeleton"
import { RadioGroup, RadioGroupItem } from "../ui/radio-group"
import { QUESTION_TYPES } from "@/lib/constants"
import { userStore } from "@/app/client/store"
import { useEffect, useRef, useState } from "react"
import { capitalizeFirstLetter, cn, removeHTML } from "@/lib/utils"
import { useTranslation } from "react-i18next"
import { EvaluationFormAnswer, EvaluationFormQuestion } from "@prisma/client"
import Button from "../shared/button"
import {
  Tag,
  TagLabel,
  TagLeftIcon,
  TagRightIcon,
  TagCloseButton,
  HStack,
  Flex,
  Box,
  RangeSlider,
  RangeSliderTrack,
  RangeSliderFilledTrack,
  RangeSliderThumb,
  Text,
} from "@chakra-ui/react"
import { motion } from "framer-motion"

export function RenderQuestion({ question, inputRef, error }) {
  inputRef[question.id] = useRef()
  console.log("question", question)
  switch (question.type) {
    // case QUESTION_TYPES.Range:
    //   return (
    //     <SliderQuestion
    //       question={question as EvaluationFormQuestion}
    //       max={5}
    //       id={question.id}
    //       inputRef={inputRef[question.id]}
    //     />
    //   )
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
        <motion.div
          initial={{ opacity: 0 }}
          animate={{ opacity: 100 }}
          transition={{ duration: 0.5 }}
        >
          <ButtonQuestion
            question={question as EvaluationFormQuestion}
            anwsers={question.EvaluationFormAnswer as EvaluationFormAnswer[]}
            inputRef={inputRef[question.id]}
            id={question.id}
            error={error}
          />
        </motion.div>
      )
    case QUESTION_TYPES.Tags:
      return (
        <TagQuestion
          question={question as EvaluationFormQuestion}
          inputRef={inputRef[question.id]}
          id={question.id}
          error={error}
        />
      )
    case QUESTION_TYPES.Range:
      return (
        <RangeQuestion
          question={question as EvaluationFormQuestion}
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
    store.save(id, parseInt(removeHTML(answer.value), 10))
    inputRef.current = {
      value: answer.value,
    }
  }

  if (isLoading) {
    return <LoadingQuestion />
  }

  console.log(anwsers)

  return (
    <div className="fade-down  w-full transition duration-300">
      <Label htmlFor={id} className={cn(error && "text-destructive", "mb-10")}>
        <span
          dangerouslySetInnerHTML={{
            __html: capitalizeFirstLetter(question.question),
          }}
        />
      </Label>
      <div className="mt-5 flex flex-col justify-center">
        {anwsers?.map((answer: EvaluationFormAnswer) =>
          answer.value === inputRef?.current?.value ||
          answer.value === value ? (
            <Button
              key={answer.label}
              onClick={() => handleAnswer(answer)}
              intent="primary"
              size="medium"
            >
              <span
                dangerouslySetInnerHTML={{
                  __html: capitalizeFirstLetter(answer.label),
                }}
              />
            </Button>
          ) : (
            <Button
              key={answer.label}
              intent="secondary"
              size="medium"
              onClick={() => handleAnswer(answer)}
            >
              <span
                dangerouslySetInnerHTML={{
                  __html: capitalizeFirstLetter(answer.label),
                }}
              />
            </Button>
          ),
        )}
      </div>
    </div>
  )
}

function TagQuestion({ question, id, inputRef, error }) {
  const store = userStore()
  const [value, setValue] = useState([])
  const [isLoading, setIsLoading] = useState(true)
  const { t } = useTranslation()

  useEffect(() => {
    const hasResponse = store.findResponse(id)
    if (hasResponse) {
      setValue(hasResponse.response as string[])
    }
    setIsLoading(false)
  }, [store, id])

  function toggleTag(tag: string) {
    if (value.includes(tag)) {
      setValue(value.filter((t) => t !== tag))
    } else {
      setValue([...value, tag])
    }
  }

  if (isLoading) {
    return <LoadingQuestion />
  }
  return (
    <div className="py-3">
      <Label
        htmlFor={id}
        className={cn(error && "text-destructive")}
        dangerouslySetInnerHTML={{
          __html: question.question,
        }}
      />
      <Box gap={5} overflow="auto" mt={2}>
        {question.tags.map((tag) => (
          <Tag
            size="lg"
            key={tag}
            borderRadius="full"
            variant="solid"
            colorScheme={value.includes(tag) ? "teal" : "gray"}
            m={2}
            onClick={(e) => {
              e.preventDefault()
              toggleTag(tag)
            }}
          >
            <TagLabel>{tag}</TagLabel>
          </Tag>
        ))}
      </Box>
      <Button
        onClick={() => store.save(id, value)}
        intent="secondary"
        size="medium"
      >
        Save
      </Button>
    </div>
  )
}
function RangeQuestion({ question, id, inputRef, error }) {
  const store = userStore()
  const [value, setValue] = useState<number[]>([])
  const [isLoading, setIsLoading] = useState(true)
  const { t } = useTranslation()

  useEffect(() => {
    const hasResponse = store.findResponse(id)
    if (hasResponse) {
      setValue(hasResponse.response as number[])
    }
    setIsLoading(false)
  }, [store, id])

  if (isLoading) {
    return <LoadingQuestion />
  }
  return (
    <div className="py-3">
      <Label
        htmlFor={id}
        className={cn(error && "text-destructive")}
        dangerouslySetInnerHTML={{
          __html: question.question,
        }}
      />
      <Box gap={5} overflow="auto" my={2}>
        <Flex direction="row" justify="space-between">
          <Text>{value[0] ?? question.range_min}</Text>
          <Text>{value[1] ?? question.range_max}</Text>
        </Flex>
        <RangeSlider
          defaultValue={[question.range_min, question.range_max]}
          min={question.range_min}
          max={question.range_max}
          onChangeEnd={(val) => setValue(val)}
        >
          <RangeSliderTrack>
            <RangeSliderFilledTrack />
          </RangeSliderTrack>
          <RangeSliderThumb index={0} />
          <RangeSliderThumb index={1} />
        </RangeSlider>
      </Box>
      <Button
        onClick={() => store.save(id, value)}
        intent="secondary"
        size="medium"
      >
        Save
      </Button>
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
        {question}
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
        {question.question}
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

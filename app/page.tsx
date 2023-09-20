import Question, {
  LoadingQuestion,
  MultipleChoiceQuestion,
  SliderQuestion,
  TextQuestion,
} from "@/components/shared/question"

export default async function Home() {
  return (
    <>
      <div className="z-10 w-full max-w-5xl px-5 xl:px-0">
        <TextQuestion />
      </div>
    </>
  )
}

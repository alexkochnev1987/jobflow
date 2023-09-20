import Question, {
  LoadingQuestion,
  MultipleChoiceQuestion,
  SliderQuestion,
  TextQuestion,
} from "@/components/shared/question"
import { getQuestions } from "./actions/server"
import Form from "@/components/shared/question"

export default async function Home() {
  const questions = await getQuestions("Werte")
  console.log(questions)
  return (
    <>
      <div className="z-10 w-full max-w-5xl px-5 xl:px-0">
        <Form
          questions={questions}
          category="Persönliche Werte"
          progress={20}
          description="Unsere Werte sind tief verwurzelte Überzeugungen und Prinzipien, die das Verhalten und die Entscheidungen einer Person leiten. Es ist wichtig, sie zu kennen, da sie als innerer Kompass dienen und helfen, authentische Entscheidungen zu treffen, die mit den eigenen Überzeugungen und Zielen in Einklang stehen."
        />
      </div>
    </>
  )
}

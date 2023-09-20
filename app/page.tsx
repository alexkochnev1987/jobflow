import { QUESTION_CATEGORIES } from "@/lib/constants"
import { getQuestions } from "./actions/server"
import Form from "@/components/shared/question"

export default async function Home() {
  let step = 1
  let valuesForm: any
  let questions = null

  switch (step) {
    case 2:
      questions = await getQuestions(QUESTION_CATEGORIES.Strengths)
      valuesForm = () => (
        <Form
          questions={questions}
          category="Stärken"
          progress={40}
          description="Die Fragen dienen dazu, die persönlichen Stärken einer Person aufgrund ihrer eigenen Selbsteinschätzung zu ermitteln und bieten Einblicke in ihre Werthaltung und Vorlieben. Ein Persönlichkeitstest wird zusätzlich verwendet, um die Stärken genauer zu analysieren und ein umfassenderes Bild der individuellen Persönlichkeit zu zeichnen."
        />
      )
      break
    case 3:
      questions = await getQuestions(QUESTION_CATEGORIES.IdealEnvironment)
      valuesForm = () => (
        <Form
          questions={questions}
          category="Der ideale Arbeitsrahmen"
          progress={60}
          description="Ein Arbeitsrahmen, der den eigenen Bedürfnissen entspricht, fördert die persönliche Zufriedenheit und das Wohlbefinden am Arbeitsplatz, da er eine angenehme und produktive Arbeitsumgebung schafft. Bei der Berufswahl ist es wichtig, diesen Rahmen zu berücksichtigen, um sicherzustellen, dass der gewählte Beruf und die Arbeitsbedingungen den individuellen Anforderungen und Vorlieben gerecht werden."
        />
      )
      break
    case 1:
    default:
      questions = await getQuestions(QUESTION_CATEGORIES.Values)
      valuesForm = () => (
        <Form
          questions={questions}
          category="Persönliche Werte"
          progress={20}
          description="Unsere Werte sind tief verwurzelte Überzeugungen und Prinzipien, die das Verhalten und die Entscheidungen einer Person leiten. Es ist wichtig, sie zu kennen, da sie als innerer Kompass dienen und helfen, authentische Entscheidungen zu treffen, die mit den eigenen Überzeugungen und Zielen in Einklang stehen."
        />
      )
      break
  }

  return (
    <>
      <div className="z-10 w-full max-w-5xl px-5 xl:px-0">{valuesForm()}</div>
    </>
  )
}

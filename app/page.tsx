import { QUESTION_CATEGORIES } from "@/lib/constants"
import { getQuestions } from "./actions/server"
import Form from "@/components/shared/question"
import { redirect, useRouter } from "next/navigation"
import { getServerSession } from "next-auth"

export default async function Home({
  searchParams,
}: {
  params: { slug: string }
  searchParams: { [key: string]: string | string[] | undefined }
}) {
  const session = await getServerSession()
  if (session?.user) {
    return redirect("/profile")
  }

  // todo check uid, and if it is associated with another user set a new uid
  const step = searchParams.step || 1
  let valuesForm: any
  let questions = null

  switch (step) {
    case "2":
      getServerSession
      questions = await getQuestions(QUESTION_CATEGORIES.Strengths)
      valuesForm = () => (
        <Form
          step={2}
          questions={questions}
          category="Stärken"
          progress={40}
          description="Die Fragen dienen dazu, die persönlichen Stärken einer Person aufgrund ihrer eigenen Selbsteinschätzung zu ermitteln und bieten Einblicke in ihre Werthaltung und Vorlieben. Ein Persönlichkeitstest wird zusätzlich verwendet, um die Stärken genauer zu analysieren und ein umfassenderes Bild der individuellen Persönlichkeit zu zeichnen."
        />
      )
      break
    case "3":
      questions = await getQuestions(QUESTION_CATEGORIES.IdealEnvironment)
      valuesForm = () => (
        <Form
          step={3}
          questions={questions}
          category="Der ideale Arbeitsrahmen"
          progress={60}
          description="Ein Arbeitsrahmen, der den eigenen Bedürfnissen entspricht, fördert die persönliche Zufriedenheit und das Wohlbefinden am Arbeitsplatz, da er eine angenehme und produktive Arbeitsumgebung schafft. Bei der Berufswahl ist es wichtig, diesen Rahmen zu berücksichtigen, um sicherzustellen, dass der gewählte Beruf und die Arbeitsbedingungen den individuellen Anforderungen und Vorlieben gerecht werden."
        />
      )
      break
    case "4":
      questions = await getQuestions(QUESTION_CATEGORIES.FinancingOptions)
      console.log(questions)
      valuesForm = () => (
        <Form
          step={4}
          questions={questions}
          category="Finanzierungsmöglichkeiten"
          progress={80}
          description="Die Fragen zur Prüfung des Anspruchs auf einen Bildungsgutschein dienen dazu, die individuellen Bildungsbedürfnisse und beruflichen Ziele einer Person zu ermitteln. Dies ermöglicht es, festzustellen, ob sie berechtigt ist, staatliche Unterstützung für die Finanzierung ihrer Weiterbildung oder Umschulung zu erhalten."
        />
      )
      break
    case "5":
      return redirect("/results")
    case "1":
    default:
      questions = await getQuestions(QUESTION_CATEGORIES.Values)
      valuesForm = () => (
        <Form
          step={1}
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
      <div className="z-10 w-full max-w-3xl">{valuesForm()}</div>
    </>
  )
}

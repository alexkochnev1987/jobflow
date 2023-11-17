import { QUESTION_CATEGORIES } from "@/lib/constants"
import { getQuestions } from "./actions/server"
import Form from "@/components/shared/question"
import { redirect, useRouter } from "next/navigation"
import { getServerSession } from "next-auth"
import t from "../i18n/config"


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
          category={t("Stärken")}
          progress={40}
          description={t("STRENGTH_DESCRIPTION")}
        />
      )
      break
    case "3":
      questions = await getQuestions(QUESTION_CATEGORIES.IdealEnvironment)
      valuesForm = () => (
        <Form
          step={3}
          questions={questions}
          category={t("Der ideale Arbeitsrahmen")}
          progress={60}
          description={t("IDEAL_ENVIRONMENT_DESCRIPTION")}
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
          category={t("Finanzierungsmöglichkeiten")}
          progress={80}
          description={t("FINANCING_DESCRIPTION")}
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
          category={t("Persönliche Werte")}
          progress={20}
          description={t("VALUES_DESCRIPTION")}
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

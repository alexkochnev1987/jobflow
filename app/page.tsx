"use server"
import { QUESTION_CATEGORIES } from "@/lib/constants"
import {
  getEvaluationFormQuestions,
  getEvaluationFormStep,
  getEvaluationFormSteps,
  getEvaluationFormStepsCount,
} from "./actions/form-evaluation"
import { redirect, useRouter } from "next/navigation"
import { getServerSession } from "next-auth"
import t from "../i18n/config"
import Form from "@/components/shared/form-evaluation"

export default async function Home() {
  const session = await getServerSession()
  if (session?.user) {
    return redirect("/profile")
  }

  return redirect("/evaluation")
}

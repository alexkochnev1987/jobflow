"use server"
import React from "react"
import GoBack from "@/components/shared/go-back"
import { getQuizByID, getQuizzResources } from "@/app/actions/quizzes"
import ViewQuizz from "./view-quizz"
import { Quizzes } from "@prisma/client"

export default async function Page({ params }: { params: { quizId: string } }) {
  const quizz = await getQuizByID(params.quizId)

  const resources = await getQuizzResources(quizz.id) || [];

  console.log("quizz", quizz)
  console.log("resources", resources)

  return (
    <div>
      <GoBack title={quizz.name} />
      <ViewQuizz image={quizz.image} description={quizz.description} prototypes={resources} />
    </div>
  )
}

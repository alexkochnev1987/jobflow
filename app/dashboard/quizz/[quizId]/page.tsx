"use server"
import React from "react"
import GoBack from "@/components/shared/go-back"
import { getQuizByID } from "@/app/actions/quizzes"
import ViewQuizz from "./view-quizz"
import { Card } from "@chakra-ui/react"

export default async function Page({ params }: { params: { quizId: string } }) {
  const quizz = await getQuizByID(params.quizId)

  console.log("quizz", quizz)

  return (
    <Card p={5}>
      <GoBack title={quizz.name} />
      <ViewQuizz quizz={quizz} />
    </Card>
  )
}

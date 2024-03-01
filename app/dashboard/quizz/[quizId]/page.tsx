"use server"
import React from "react"
import GoBack from "@/components/shared/go-back"
import { getQuizByID, getQuizzResources } from "@/app/actions/quizzes"
import ViewQuizz from "./view-quizz"
import { Quizzes } from "@prisma/client"
import { Card } from "@chakra-ui/react"

export default async function Page({ params }: { params: { quizId: string } }) {
  const quizz = await getQuizByID(params.quizId)

  const resources = (await getQuizzResources(quizz.id)) || []

  console.log("quizz", quizz)
  console.log("resources", resources)

  return (
    <Card className="!shadow-none" p={5}>
      <GoBack title={quizz.name} />
      <ViewQuizz
        image={quizz.image}
        content={quizz.content}
        type={quizz.type}
        prototypes={resources}
      />
    </Card>
  )
}

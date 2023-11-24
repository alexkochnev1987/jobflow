import { getCareers } from "@/app/actions/server"
import { QUESTION_CATEGORIES } from "@/lib/constants"
import { completition } from "@/lib/openai"
import prisma from "@/lib/prisma"
import { sliderResponseToText } from "@/lib/utils"
import { getServerSession } from "next-auth"
import { NextRequest, NextResponse } from "next/server"
import { retry } from "radash"
import { authOptions } from "../auth/[...nextauth]/route"
import { v4 as uuid } from "uuid"
import { getUserPersonalities } from "@/app/actions/user-personality"

async function mapCareers(evaluationResponse: any) {
  const jsonRes = JSON.parse(evaluationResponse.toString())
  const careers = await getCareers()

  const sorted = jsonRes.careers
    .map((r) => ({
      ...r,
      data: careers.find((c) => c.id === r.uid),
    }))
    .sort((a, b) => b.rating - a.rating)

  return {
    careers: sorted,
  }
}

export async function POST(request: NextRequest) {
  const { uid } = await request.json()
  const profile = await prisma?.profile?.findFirst({
    where: {
      uid,
    },
  })

  if (profile?.evaluation_response) {
    return NextResponse.json(await mapCareers(profile.evaluation_response))
  }

  const userResponses = await prisma?.evaluationFormUserResponse.findMany({
    where: {
      uid,
    },
    select: {
      answer: true,
      EvaluationFormQuestion: {
        select: {
          id: true,
          question: true,
        },
      },
    },
  })

  const userResponsesText = userResponses
    .map((r) => `${r.EvaluationFormQuestion.question}: ${r.answer}`)
    .join("\n")

  const careers = await getCareers()

  const careersText = careers
    .map((c) => `uid: ${c.id} - name: ${c.name}`)
    .join("\n")

  const personalities = await getUserPersonalities()

  const personalitiesText = personalities.map((p) => `${p.name}`).join("\n")

  const res = await retry(
    {
      times: 3,
      delay: 1000,
    },
    async () => {
      const prompt = `Benutzerprofil:
  
      ${userResponsesText}
  
  Aufgabenanweisungen:
  
  Stellen Sie sich vor, Sie sind ein fortschrittlicher KI-Karriereberater. Basierend auf den persönlichen Werten des Benutzers und seiner idealen Arbeitsumgebung, generieren Sie die folgenden Variablen:
  
  Sie bei der Arbeit (youAtWork): Beschreiben Sie den Arbeitsstil des Benutzers unter Berücksichtigung seiner Werte und Vorlieben.
  Stärken (strengths): Zählen Sie die Stärken des Benutzers auf, basierend auf seinen Werten und wie diese Stärken mit seiner idealen Arbeitsumgebung in Einklang stehen.
  Sobald Sie diese Variablen generiert haben, ordnen Sie das Benutzerprofil den am besten geeigneten Karrierewegen aus der bereitgestellten Liste zu. Weisen Sie jedem Beruf eine Prozentbewertung zu, die den Grad der Eignung angibt. Ordnen Sie die Berufe absteigend nach der Prozentübereinstimmung an.
  
  Zu vergleichende Berufe:
  
  ${careersText}
  
  Zusätzliche Richtlinien:
  
  Berücksichtigen Sie die generierten Variablen ('youAtWork' und 'strengths') sorgfältig bei den Zuordnungen.
  Geben Sie für jede Zuordnung eine detaillierte Analyse ab, in der erklärt wird, warum der Beruf zum Benutzerprofil passt.
  Gewährleisten Sie Genauigkeit und Gründlichkeit bei Ihren Bewertungen.
  Verwenden Sie Prozentbewertungen, um die Eignung jedes Berufs zu quantifizieren.
  Kommentieren Sie nicht das Ergebnis; konzentrieren Sie sich darauf, präzise und fundierte Zuordnungen bereitzustellen.
  `
      console.log(prompt)

      console.log("trying to get results")

      const modelResponse = await completition(prompt)

      const choices =
        modelResponse.choices?.[0]?.message?.function_call?.arguments || ""

      const fnResponse = JSON.parse(choices)

      console.log("careers", fnResponse)

      if (fnResponse.careers.some((c) => c.rating <= 1)) {
        throw new Error("Some careers don't have a rating")
      }

      return prisma.profile.upsert({
        where: {
          uid,
        },
        create: {
          id: uuid(),
          evaluation_response: JSON.stringify(choices),
          uid: `${uid}`,
        },
        update: {
          evaluation_response: JSON.stringify(choices),
        },
      })
    },
  )

  const data = await mapCareers(res.evaluation_response)
  return NextResponse.json(data)
}

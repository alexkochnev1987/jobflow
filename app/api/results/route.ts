import { getCareers } from "@/app/actions/server"
import { QUESTION_CATEGORIES } from "@/lib/constants"
import { completition } from "@/lib/openai"
import prisma from "@/lib/prisma"
import { sliderResponseToText } from "@/lib/utils"
import { getServerSession } from "next-auth"
import { NextRequest, NextResponse } from "next/server"

async function mapCareers(res: any) {
  const jsonRes = JSON.parse(res.result.toString())
  const careers = await getCareers()

  const sorted = jsonRes.careers
    .map((r) => ({
      ...r,
      data: careers.find((c) => c.id === r.uid),
    }))
    .sort((a, b) => b.rating - a.rating)

  return {
    youAtWork: (jsonRes.youAtWork || "").split("\n").filter((t) => t !== ""),
    strengths: (jsonRes.strengths || "").split("\n").filter((t) => t !== ""),
    careers: sorted,
  }
}

export async function POST(request: NextRequest) {
  const { uid } = await request.json()
  const session = await getServerSession()
  let user = null
  let res = null

  if (session?.user) {
    console.log("got session", session)
    user = await prisma?.user.findFirst({
      where: {
        email: session.user.email,
      },
    })
  }

  console.log("uid", { uid })

  if (user) {
    res = await prisma?.modelQuestionResponseResult?.findFirst({
      where: {
        userId: user.id,
      },
    })

    console.log("got user", user)

    if (res?.result) {
      console.log("returning saved value in db")
      const data = await mapCareers(res)
      return NextResponse.json(data)
    }
  }

  res = await prisma?.modelQuestionResponseResult?.findFirst({
    where: {
      questionResponseId: uid,
    },
  })

  const userResponse = await prisma?.userResponses.findFirst({
    where: {
      uid,
    },
    include: {
      responses: true,
    },
  })

  if (!userResponse) {
    throw new Error(`Invalid uid ${uid}`)
  }

  if (user) {
    console.log("associating user with responses")
    await prisma?.userResponses.update({
      where: {
        uid,
      },
      data: {
        userId: user.id,
      },
    })

    await prisma?.modelQuestionResponseResult.update({
      where: {
        questionResponseId: uid,
      },
      data: {
        userId: user.id,
      },
    })

    if (res?.result) {
      console.log("returning saved value in db")
      const data = await mapCareers(res)
      return NextResponse.json(data)
    }
  }

  console.log("calculating careers")

  // load questions
  const questions = await prisma?.question?.findMany({
    orderBy: {
      category: "asc",
    },
  })

  const groupedQuestions = questions.reduce((prev, q) => {
    const response = userResponse.responses.find((r) => r.questionId === q.id)

    prev[q.category] = prev[q.category] || []
    if (response) {
      const item = {
        question: q.question,
        response: response.response,
        text: `${q.question}\n${response.response}`,
      }
      prev[q.category].push(item)
    }
    return prev
  }, {})

  // get responses

  const valueQuestions = groupedQuestions[QUESTION_CATEGORIES.Values]
    .map((r) => r.text)
    .join("\n")

  const strengthQuestions = groupedQuestions[QUESTION_CATEGORIES.Strengths]
    .map((r) => r.text)
    .join("\n")

  const idealEnvQuestions = groupedQuestions[
    QUESTION_CATEGORIES.IdealEnvironment
  ]
    .map((r) => `${r.question}: ${sliderResponseToText(r.response)}`)
    .join("\n")

  const careers = (await prisma.careers.findMany())
    .map((c) => `uid: ${c.id} - name: ${c.name}`)
    .join("\n")

  const prompt = `Benutzerprofil:
  Persönliche Werte:
  {values}
  
  Stärken:
  {strengths}
  
  Ideale Arbeitsumgebung:
  {environment}
  
  Aufgabenanweisungen:
  
  Stellen Sie sich vor, Sie sind ein fortschrittlicher KI-Karriereberater. Basierend auf den persönlichen Werten des Benutzers und seiner idealen Arbeitsumgebung, generieren Sie die folgenden Variablen:
  
  Sie bei der Arbeit (youAtWork): Beschreiben Sie den Arbeitsstil des Benutzers unter Berücksichtigung seiner Werte und Vorlieben.
  Stärken (strengths): Zählen Sie die Stärken des Benutzers auf, basierend auf seinen Werten und wie diese Stärken mit seiner idealen Arbeitsumgebung in Einklang stehen.
  Sobald Sie diese Variablen generiert haben, ordnen Sie das Benutzerprofil den am besten geeigneten Karrierewegen aus der bereitgestellten Liste zu. Weisen Sie jedem Beruf eine Prozentbewertung zu, die den Grad der Eignung angibt. Ordnen Sie die Berufe absteigend nach der Prozentübereinstimmung an.
  
  Zu vergleichende Berufe:
  
  ${careers}
  
  Zusätzliche Richtlinien:
  
  Berücksichtigen Sie die generierten Variablen ('youAtWork' und 'strengths') sorgfältig bei den Zuordnungen.
  Geben Sie für jede Zuordnung eine detaillierte Analyse ab, in der erklärt wird, warum der Beruf zum Benutzerprofil passt.
  Gewährleisten Sie Genauigkeit und Gründlichkeit bei Ihren Bewertungen.
  Verwenden Sie Prozentbewertungen, um die Eignung jedes Berufs zu quantifizieren.
  Kommentieren Sie nicht das Ergebnis; konzentrieren Sie sich darauf, präzise und fundierte Zuordnungen bereitzustellen.
  `
    .replace("{values}", valueQuestions)
    .replace("{strengths}", strengthQuestions)
    .replace("{environment}", idealEnvQuestions)

  console.log(prompt)
  const modelResponse = await completition(prompt)

  const choices =
    modelResponse.choices?.[0]?.message?.function_call?.arguments || ""

  console.log(choices)

  res = await prisma.modelQuestionResponseResult.upsert({
    where: {
      questionResponseId: userResponse.uid,
    },
    create: {
      response: JSON.stringify(modelResponse),
      result: choices,
      questionResponseId: uid,
    },
    update: {
      response: JSON.stringify(modelResponse),
      result: choices,
    },
  })

  const data = await mapCareers(res)
  return NextResponse.json(data)
}

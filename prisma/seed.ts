import { PrismaClient } from "@prisma/client"
const prisma = new PrismaClient()

const CATEGORIES = {
  Values: "values",
  Strengths: "strengths",
  IdealEnvironment: "ideal_environment",
}

const TYPES = {
  Text: "text",
  Slider: "slider",
}

async function main() {
  let order = 1
  const insertQuestion = async ({
    question,
    category,
    type,
    min = 1,
    max = 5,
  }: {
    question: string
    category: string
    type: string
    min?: number
    max?: number
  }) => {
    await prisma.question.upsert({
      where: {
        question,
      },
      update: {
        category,
        order,
        question,
        type,
        max,
        min,
      },
      create: {
        category,
        order,
        question,
        type,
        max,
        min,
      },
    })
    order++
  }
  const addTextInput = (question: string, category: string) => {
    return insertQuestion({ question, category, type: TYPES.Text })
  }

  const addSlider = (question: string, category: string) => {
    return insertQuestion({
      question,
      category,
      type: TYPES.Slider,
      min: 1,
      max: 5,
    })
  }

  // Values
  const values = [
    "Was wäre die eine Sache, die ich auf der Welt ändern könnte?",
    "Welche Charakterzüge haben die Menschen, die ich bewundere?",
    "Was fordere ich typischerweise von meinen Mitmenschen ein?",
    "Was würde ich tun, wenn ich nur noch einen Monat zu leben hätte?",
    "Welche Charaktereigenschaft stört mich an anderen?",
    "Wie reagiere ich typischerweise, wenn ich überraschend emotional bin?",
    "Wie sieht ein perfekter Tag für dich aus?",
  ]

  for (const value of values) {
    await addTextInput(value, CATEGORIES.Values)
  }

  const strengths = [
    "Wobei bitten dich Menschen immer um Hilfe?",
    "Was ist für dich selbstverständlich, was andere aber immer wieder erstaunt?",
    "Wirst du manchmal ungeduldig, wenn andere etwas bestimmtes machen?",
    "Welche Tätigkeit ist das?",
    "Worin war ich als Kind besonders gut, was ich heute nicht mehr von mir behaupten würde?",
  ]

  for (const value of strengths) {
    await addTextInput(value, CATEGORIES.Strengths)
  }

  const idealEnvironments = [
    "Ich würde auch bei Wind und Wetter lieber draußen arbeiten",
    "Ich wäre für meinen Beruf gerne sehr viel unterwegs",
    "Ich würde gerne von überall aus arbeiten können",
    "Ich arbeite lieber für mich alleine als im Team",
    "Ich lerne im Rahmen meines Berufs gerne immer neue Dinge",
    "Ich arbeite lieber in einem Start-Up als in einem Konzern",
    "Ich hätte gerne Kundenkontakt in meinem Beruf",
    "Ich habe lieber Abwechslung als Routine",
    "Ich möchte bei der Arbeit anziehen was ich möchte",
  ]

  for (const value of idealEnvironments) {
    await addSlider(value, CATEGORIES.IdealEnvironment)
  }
}
main()
  .then(async () => {
    await prisma.$disconnect()
  })
  .catch(async (e) => {
    console.error(e)
    await prisma.$disconnect()
    process.exit(1)
  })

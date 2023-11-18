import { QUESTION_CATEGORIES, QUESTION_TYPES } from "../lib/constants"
import { PrismaClient } from "@prisma/client"
const prisma = new PrismaClient()

var uuid = require("uuid")

async function seedCareers() {
  const careers = [
    {
      name: "Web-Entwickler",
      description: "Entwickelt und gestaltet Webanwendungen und Websites.",
      salaryMin: 40000,
      salaryMax: 90000,
      retrainingWeeks: 12,
    },
    {
      name: "UX-Designer",
      description:
        "Gestaltet die Benutzererfahrung von Produkten und Dienstleistungen.",
      salaryMin: 45000,
      salaryMax: 100000,
      retrainingWeeks: 16,
    },
    {
      name: "Product Manager",
      description:
        "Verantwortlich für die Entwicklung und Vermarktung von Produkten.",
      salaryMin: 60000,
      salaryMax: 120000,
      retrainingWeeks: 20,
    },
    {
      name: "Flugbegleiter",
      description:
        "Sorgt für die Sicherheit und den Komfort von Flugpassagieren.",
      salaryMin: 30000,
      salaryMax: 50000,
      retrainingWeeks: 8,
    },
    {
      name: "Rettungssanitäter",
      description:
        "Bietet medizinische Versorgung und Erste Hilfe in Notfällen.",
      salaryMin: 35000,
      salaryMax: 55000,
      retrainingWeeks: 10,
    },
    {
      name: "Sales Manager",
      description: "Leitet und koordiniert Verkaufsaktivitäten und Teams.",
      salaryMin: 50000,
      salaryMax: 120000,
      retrainingWeeks: 16,
    },
  ]

  for (const career of careers) {
    await prisma?.careers?.upsert({
      where: {
        name: career.name,
      },
      create: {
        id: uuid.v4(),
        ...career,
      },
      update: {
        ...career,
      },
    })
  }
}

async function seedTags() {
  // open csv file in seed/tags.csv and parse it as an array of objects
  // for each object, create a tag in the database
}

async function seedSteps() {
  const steps = [
    {
      title: "Persönliche Werte",
      description:
        "Unsere Werte sind tief verwurzelte Überzeugungen und Prinzipien, die das Verhalten und die Entscheidungen einer Person leiten. Es ist wichtig, sie zu kennen, da sie als innerer Kompass dienen und helfen,",
    },
    {
      title: "Stärken",
      description:
        "Die Fragen dienen dazu, die persönlichen Stärken einer Person aufgrund ihrer eigenen Selbsteinschätzung zu ermitteln und bieten Einblicke in ihre Werthaltung und Vorlieben. Ein Persönlichkeitstest wird zusätzlich verwendet, um die Stärken genauer zu analysieren und ein umfassenderes Bild der individuellen Persönlichkeit zu zeichnen.",
    },
    {
      title: "Der ideale Arbeitsrahmen",
      description:
        "Ein Arbeitsrahmen, der den eigenen Bedürfnissen entspricht, fördert die persönliche Zufriedenheit und das Wohlbefinden am Arbeitsplatz, da er eine angenehme und produktive Arbeitsumgebung schafft. Bei der Berufswahl ist es wichtig, diesen Rahmen zu berücksichtigen, um sicherzustellen, dass der gewählte Beruf und die Arbeitsbedingungen den individuellen Anforderungen und Vorlieben gerecht werden.",
    },
    {
      title: "Stärken",
      description:
        "Die Fragen dienen dazu, die persönlichen Stärken einer Person aufgrund ihrer eigenen Selbsteinschätzung zu ermitteln und bieten Einblicke in ihre Werthaltung und Vorlieben. Ein Persönlichkeitstest wird zusätzlich verwendet, um die Stärken genauer zu analysieren und ein umfassenderes Bild der individuellen Persönlichkeit zu zeichnen.",
    },
    {
      title: "Finanzierungsmöglichkeiten",
      description:
        "Die Fragen zur Prüfung des Anspruchs auf einen Bildungsgutschein dienen dazu, die individuellen Bildungsbedürfnisse und beruflichen Ziele einer Person zu ermitteln. Dies ermöglicht es, festzustellen, ob sie berechtigt ist, staatliche Unterstützung für die Finanzierung ihrer Weiterbildung oder Umschulung zu erhalten.",
    },
  ]

  for (const step of steps) {
    await prisma?.evaluationFormStep?.upsert({
      where: {
        title: step.title,
      },
      create: {
        ...step,
      },
      update: {
        ...step,
      },
    })
  }
}

async function main(): Promise<void> {
  await seedCareers()
  await seedSteps()
  let order = 1
  const insertQuestion = async ({
    question,
    step,
    type,
  }: {
    question: string
    step: number
    type: string
  }) => {
    await prisma.evaluationFormQuestion.upsert({
      where: {
        question,
      },
      update: {
        step,
        sort: order,
        question,
        type,
      },
      create: {
        step,
        sort: order,
        question,
        type,
      },
    })
    order++
  }
  const addTextInput = (question: string, step: number) => {
    return insertQuestion({ question, step, type: QUESTION_TYPES.Text })
  }

  const addYesNoCheckbox = (question: string, step: number) => {
    return insertQuestion({
      question,
      step,
      type: QUESTION_TYPES.Checkbox,
    })
  }

  const addSlider = (question: string, step: number) => {
    return insertQuestion({
      question,
      step,
      type: QUESTION_TYPES.Range,
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

  order = 1
  for (const value of values) {
    await addTextInput(value, 1)
  }

  const strengths = [
    "Wobei bitten dich Menschen immer um Hilfe?",
    "Was ist für dich selbstverständlich, was andere aber immer wieder erstaunt?",
    "Wirst du manchmal ungeduldig, wenn andere etwas bestimmtes machen?",
    "Welche Tätigkeit ist das?",
    "Worin war ich als Kind besonders gut, was ich heute nicht mehr von mir behaupten würde?",
  ]

  order = 1
  for (const value of strengths) {
    await addTextInput(value, 2)
  }

  const financingOptions = [
    "Beziehst du aktuell Arbeitslosengeld?",
    "Bist du aktuell in Kurzarbeit?",
    "Hast du einen befristeten Arbeitsvertrag?",
  ]

  order = 1
  for (const value of financingOptions) {
    await addYesNoCheckbox(value, 3)
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

  order = 1
  for (const value of idealEnvironments) {
    await addSlider(value, 4)
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

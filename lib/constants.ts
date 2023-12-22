import { PrismaClient } from "@prisma/client"

export const QUESTION_CATEGORIES = {
  Values: "Werte",
  Strengths: "Stärken",
  IdealEnvironment: "Ideale Arbeitsrahmen",
  FinancingOptions: "Finanzierungsmöglichkeiten",
}

export const QUESTION_TYPES = {
  Text: "text",
  Range: "range",
  Checkbox: "checkbox",
  Button: "button",
  Select: "select",
  MBTI: "mbti",
}

export const ROUTES = {
  DashBoard: "/dashboard",
  Login: "/dashboard/login",
  Register: "/dashboard/register",
  Evaluation: "/test",
  EvaluationResults: "/test/results",
  Trainings: "/dashboard/trainings",
  AddCourse: "/dashboard/trainings/course/add",
  EditCourse: "/dashboard/trainings/course/edit",
}

export const DEPLOY_URL = `https://app.shiftyourcareer.de/`

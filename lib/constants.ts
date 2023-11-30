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
  Evaluation: "/evaluation",
  EvaluationResults: "/evaluation/results",
}

export const DEPLOY_URL = `https://test.laborflow.io/`

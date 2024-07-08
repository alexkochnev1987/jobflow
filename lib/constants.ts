import { PrismaClient } from "@prisma/client"

export const QUESTION_CATEGORIES = {
  Values: "Werte",
  Strengths: "Stärken",
  IdealEnvironment: "Ideale Arbeitsrahmen",
  FinancingOptions: "Finanzierungsmöglichkeiten",
}

export const QUESTION_TYPES = {
  Text: "text",
  Tags: "tags",
  Range: "range",
  Checkbox: "checkbox",
  Button: "button",
  Select: "select",
  MBTI: "mbti",
}

export const ROUTES = {
  DashBoard: "/dashboard",
  Settings: "/dashboard/settings",
  Login: "/login",
  Payment: "/payment",
  Contact: "/contact",
  Register: "/register",
  Evaluation: "/test",
  EvaluationResults: "/test/results",
  Trainings: "/trainings",
  AddCourse: "/trainings/courses/add",
  ViewCourse: (id: string) => "/dashboard/course/" + id,
  ViewTest: (id: string) => "/dashboard/quizz/" + id,
  ViewCareer: (id: string) => "/dashboard/career/" + id,
  EditCourse: "/trainings/courses/edit",
  ResetPassword: (token: string) => `/login/reset-password?token=${token}`,
}

export const DEPLOY_URL = `https://app.quereinstieg.com/`

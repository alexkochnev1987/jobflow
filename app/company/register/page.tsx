import { RegisterForm } from "./form"
import { ROUTES } from "@/lib/constants"
import { redirect } from "next/navigation"
import { auth } from "auth"

export default async function RegisterPage() {
  const session = await auth()

  if (session) {
    return redirect(ROUTES.DashBoard)
  }
  return <RegisterForm />
}

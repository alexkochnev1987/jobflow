import { getServerSession } from "next-auth"
import { RegisterForm } from "./form"
import { ROUTES } from "@/lib/constants"
import { redirect } from "next/navigation"

export default async function RegisterPage() {
  const session = await getServerSession()

  if (session) {
    return redirect(ROUTES.DashBoard)
  }
  return <RegisterForm />
}

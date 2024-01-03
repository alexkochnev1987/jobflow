import { getServerSession } from "next-auth"
import { RegisterForm } from "./form"
import { ROUTES } from "@/lib/constants"
import { redirect } from "next/navigation"
import { authOptions } from "@/app/api/auth/[...nextauth]/route"

export default async function RegisterPage() {
  const session = await getServerSession(authOptions)

  if (session) {
    return redirect(ROUTES.DashBoard)
  }
  return <RegisterForm />
}

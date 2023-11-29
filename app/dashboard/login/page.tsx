import { getServerSession } from "next-auth"
import { LoginForm } from "./form"
import { authOptions } from "@/app/api/auth/[...nextauth]/route"
import { redirect } from "next/navigation"
import { ROUTES } from "@/lib/constants"

export default async function LoginPage() {
  const session = await getServerSession(authOptions)

  if (session) {
    return redirect(ROUTES.DashBoard)
  }
  return (
    <>
      <LoginForm />
    </>
  )
}

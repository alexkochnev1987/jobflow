import { LoginForm } from "./form"
import { redirect } from "next/navigation"
import { ROUTES } from "@/lib/constants"
import { auth } from "auth"

export default async function LoginPage() {
  const session = await auth()

  if (session) {
    return redirect(ROUTES.DashBoard)
  }
  return (
    <>
      <LoginForm />
    </>
  )
}

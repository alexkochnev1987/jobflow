import { RegisterForm } from "./form"
import { ROUTES } from "@/lib/constants"
import { redirect } from "next/navigation"
import { auth } from "auth"

export default async function RegisterPage() {
  console.log("RegisterPage")

  const session = await auth()

  if (session) {
    return redirect(ROUTES.DashBoard)
  }
  return (
    <div className="mx-auto max-w-sm">
      <RegisterForm />
    </div>
  )
}

import { getServerSession } from "next-auth"
import { LoginForm } from "./form"
import { redirect } from "next/navigation"
import { ROUTES } from "@/lib/constants"

export default async function LoginPage() {
  const session = await getServerSession()

  if (session) {
    return redirect(ROUTES.DashBoard)
  }
  return (
    <div className="max-w-sm mx-auto">
      <LoginForm />
    </div>
  )
}

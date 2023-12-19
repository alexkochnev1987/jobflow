import { getServerSession } from "next-auth"
import { RegisterForm } from "./form"
import { authOptions } from "@/app/api/auth/[...nextauth]/route"
import { ROUTES } from "@/lib/constants"
import { redirect } from "next/navigation"

export default async function RegisterPage() {
  const session = await getServerSession(authOptions)

  if (session) {
    return redirect(ROUTES.DashBoard)
  }
  return (
    <div className="max-w-sm mx-auto">
      <RegisterForm />
    </div>
  )
}

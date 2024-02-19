import { LoginForm } from "./form"
import { redirect } from "next/navigation"
import { ROUTES } from "@/lib/constants"
import { auth } from "auth"
import { Flex } from "@radix-ui/themes"
import LoginBackground from "./bg"

export default async function LoginPage() {
  const session = await auth()

  if (session) {
    return redirect(ROUTES.DashBoard)
  }
  return (
    <div className="flex flex-row">
      <LoginBackground />
      <Flex justify="center" align="center" className="mx-auto max-w-md w-full">
        <LoginForm />
      </Flex>
    </div>
  )
}

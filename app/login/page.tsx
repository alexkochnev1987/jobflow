import { LoginForm } from "./form"
import { redirect } from "next/navigation"
import { ROUTES } from "@/lib/constants"
import { auth } from "auth"
import { Flex } from "@radix-ui/themes"

export default async function LoginPage() {
  const session = await auth()

  if (session) {
    return redirect(ROUTES.DashBoard)
  }
  return (
    <div className="flex flex-row">
      <div
        style={{
          backgroundImage: `url(/login-bg.png)`,
        }}
        className="hidden min-h-screen w-1/2 bg-cover bg-center md:block"
      ></div>
      <Flex justify="center" align="center" className="mx-auto">
        <LoginForm />
      </Flex>
    </div>
  )
}

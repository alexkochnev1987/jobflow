import { RegisterForm } from "./form"
import { ROUTES } from "@/lib/constants"
import { redirect } from "next/navigation"
import { auth } from "auth"
import { Flex } from "@radix-ui/themes"
import RegisterBackground from "./bg"
import FooterComponent from "@/components/layout/footer"

export default async function RegisterPage() {
  const session = await auth()

  if (session) {
    return redirect(ROUTES.DashBoard)
  }

  return (
    <div className="flex w-full flex-col">
      <div className="flex min-h-screen max-h-full w-full justify-between flex-col-reverse md:flex-row">
        <RegisterBackground />
        <Flex justify="center" align="center" className="mx-auto max-w-md w-full h-full">
          <RegisterForm />
        </Flex>
      </div>
      <FooterComponent></FooterComponent>
    </div>
  )
}

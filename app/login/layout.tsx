import { LoginForm } from "./form"
import { Flex } from "@radix-ui/themes"
import LoginBackground from "./bg"
import FooterComponent from "@/components/layout/footer"

export default async function LoginLayout({
  children,
}: {
  children: React.ReactNode
}) {
  return (
    <div className="flex w-full flex-col">
      <div className="flex h-screen flex-col-reverse justify-between md:flex-row">
        <LoginBackground />
        <Flex
          justify="center"
          align="center"
          className="mx-auto h-full w-full max-w-md"
        >
          {children}
        </Flex>
      </div>
      <FooterComponent></FooterComponent>
    </div>
  )
}

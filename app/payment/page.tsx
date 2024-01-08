import { redirect } from "next/navigation"
import { ROUTES } from "@/lib/constants"
import Logo from "@/icons/logo.svg"
import { auth } from "auth"
import { Box, Container, Flex, Grid } from "@radix-ui/themes"
import Image from "next/image"
import Link from "next/link"
import Button from "@/components/shared/button"
import l18n from "@/i18n/config"

export default async function LoginPage() {
  const session = await auth()

  if (session) {
    return redirect(ROUTES.DashBoard)
  }
  return (
    <Container className="mx-4">
      <Logo className="mx-auto my-4" />

      <div className="flex flex-col lg:flex-row">
        <Image
          alt="Sucess"
          height={550}
          width={550}
          src={"/success.png"}
          className="max-w-24 mx-auto max-h-24 lg:mr-4 lg:max-h-none lg:max-w-none"
        />
        <Flex
          direction="column"
          justify="center"
          align="center"
          className="mx-auto"
        >
          <h1 className="text-left text-2xl">
            {l18n.t(
              "payment.success.title",
              "Herzlichen Glückwunsch!  Dein Testergebnis ist jetzt verfügbar!",
            )}
          </h1>
          <p className="text-base font-normal">
            {l18n.t(
              "payment.success.body",
              "Deine persönlichen Anmeldeinformationen wurden dir soeben per E-Mail zugesendet. Bitte überprüfe dein Postfach und melde dich zur Einsicht deiner Ergebnisse einfach an.",
            )}
          </p>
          <Button
            as="a"
            href={ROUTES.Login}
            className="my-2 w-auto self-start rounded-full !bg-rose-500  !hover:bg-rose-600"
          >
            Jetzt anmelden
          </Button>

          <p className="mt-6 text-sm">
            {l18n.t(
              "payment.success.footer",
              "Bitte beachten Sie, dass Ihre Ergebnisse ausschließlich für Sie bestimmt sind und vertrauliche Informationen enthalten können. Falls Sie Probleme beim Zugriff haben",
            )}
            ,{" "}
            <Link href={ROUTES.Contact} className="underline">
              {l18n.t(
                "payment.success.contact",
                "kontaktieren Sie bitte den Support.",
              )}
            </Link>
          </p>
        </Flex>
      </div>
    </Container>
  )
}

import { getServerSession } from "next-auth"
import { LoginForm } from "./form"
import { redirect } from "next/navigation"
import { ROUTES } from "@/lib/constants"
import NavBar from "@/components/layout/navbar"
import FooterComponent from "@/components/layout/footer"

export default async function LoginPage() {
  const session = await getServerSession()

  if (session) {
    return redirect(ROUTES.DashBoard)
  }
  return (
    <div>
      <NavBar session={session} />
      <main className="mx-auto flex min-h-screen w-full max-w-6xl justify-center">
        <div className="mx-auto max-w-sm">
          <LoginForm />
        </div>
      </main>
      <FooterComponent />
    </div>
  )
}

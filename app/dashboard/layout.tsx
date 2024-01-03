"use server"
// import Logo from "@/icons/logo2.svg"
import NavBar from "@/components/layout/navbar"
import { ReactElement, use } from "react"
import DashBoardSidebar from "@/components/layout/sidebar"
import Footer from "@/components/layout/footer"
import {
  getUserByEmail,
  getUserProfileById,
  hasCompletedEvaluation,
  isCompanyUser,
} from "../actions/user"
import { ROUTES } from "@/lib/constants"
import { redirect } from "next/navigation"
import { auth } from "auth"

export default async function DashboardLayout({
  children, // will be a page or nested layout
}: {
  children: React.ReactNode
}): Promise<ReactElement> {
  const session = await auth()
  const isCompany = await isCompanyUser(session?.user?.email)

  if (!session?.user) {
    return redirect(ROUTES.Login)
  }

  return (
    <div>
      <NavBar session={session} isCompany={isCompany} />
      <main className="mx-auto flex min-h-screen w-full max-w-5xl justify-stretch py-5">
        <div className="w-full px-5 ">{children}</div>
      </main>
      <Footer />
    </div>
  )
}

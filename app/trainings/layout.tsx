"use server"
import { ReactElement } from "react"

import { ROUTES } from "@/lib/constants"
import { redirect } from "next/navigation"
import { isCompanyUser } from "@/app/actions/user"
import NavBar from "@/components/layout/navbar"
import FooterComponent from "@/components/layout/footer"
import { auth } from "auth"

export default async function DashboardLayout({
  children, // will be a page or nested layout
}: {
  children: React.ReactNode
}): Promise<ReactElement> {
  const session =await auth()
  const isCompany = await isCompanyUser(session?.user?.email)

  if (!isCompany) {
    return redirect(ROUTES.Login)
  }

  return (
    <div>
      <NavBar session={session} isCompany={isCompany} />
      <main className="mx-auto flex min-h-screen w-full max-w-5xl justify-stretch py-20">
        <div className="w-full px-5 ">{children}</div>
      </main>
      <FooterComponent />
    </div>
  )
}

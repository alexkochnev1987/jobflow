"use server"
import { getServerSession } from "next-auth"
import { ReactElement } from "react"

import { ROUTES } from "@/lib/constants"
import { redirect } from "next/navigation"
import { isCompanyUser } from "@/app/actions/user"
import { authOptions } from "@/app/api/auth/[...nextauth]/route"

export default async function DashboardLayout({
  children, // will be a page or nested layout
}: {
  children: React.ReactNode
}): Promise<ReactElement> {
  const session = await getServerSession(authOptions)
  const isCompany = await isCompanyUser(session?.user?.email)

  if (!isCompany) {
    return redirect(ROUTES.Login)
  }

  return <>{children}</>
}

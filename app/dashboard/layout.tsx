"use server"
import { getServerSession } from "next-auth"
import { authOptions } from "../api/auth/[...nextauth]/route"
// import Logo from "@/components/shared/icons/logo2.svg"
import NavBar from "@/components/layout/navbar"
import { ReactElement } from "react"
import DashBoardSidebar from "@/components/layout/sidebar"

export default async function DashboardLayout({
  children, // will be a page or nested layout
}: {
  children: React.ReactNode
}): Promise<ReactElement> {
  const session = await getServerSession(authOptions)
  if (!session?.user) {
    return (
      <div>
        <NavBar session={session} />
        <main className="mx-auto flex min-h-screen w-full max-w-6xl justify-center">
          {children}
        </main>
      </div>
    )
  }
  return (
    <div>
      <NavBar session={session} />
      <main className="mx-auto flex min-h-screen w-full max-w-6xl justify-stretch py-5">
        <DashBoardSidebar />
        <div className="w-full px-5 ">{children}</div>
      </main>
    </div>
  )
}
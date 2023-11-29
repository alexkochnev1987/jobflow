"use server"
import { getServerSession } from "next-auth"
import { authOptions } from "../api/auth/[...nextauth]/route"
import NavBar from "@/components/layout/navbar"

export default async function DashboardLayout({
  children, // will be a page or nested layout
}: {
  children: React.ReactNode
}) {
  const session = await getServerSession(authOptions)
  return (
    <div>
      <NavBar session={session} />
      <main className="flex min-h-screen w-full">{children}</main>
    </div>
  )
}

"use server"
import { getServerSession } from "next-auth"
import { authOptions } from "../api/auth/[...nextauth]/route"
// import Logo from "@/components/shared/icons/logo2.svg"
import Link from "next/link"
import NavBar from "@/components/layout/navbar"

export default async function DashboardLayout({
  children, // will be a page or nested layout
}: {
  children: React.ReactNode
}) {
  const session = await getServerSession(authOptions)
  return (
    <div>
      <NavBar/>
      <main className="mx-auto flex min-h-screen w-full max-w-6xl justify-center">
        {children}
      </main>
    </div>
  )
}

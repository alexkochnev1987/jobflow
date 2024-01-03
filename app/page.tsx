"use server"
import { redirect } from "next/navigation"
import { getServerSession } from "next-auth"
import { ROUTES } from "@/lib/constants"
import { authOptions } from "./api/auth/[...nextauth]/route"

export default async function Home() {
  const session = await getServerSession(authOptions)
  if (session?.user) {
    return redirect(ROUTES.DashBoard)
  }

  return redirect(ROUTES.Evaluation)
}

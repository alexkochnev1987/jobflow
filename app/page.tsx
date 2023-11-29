"use server"
import { redirect } from "next/navigation"
import { getServerSession } from "next-auth"
import { ROUTES } from "@/lib/constants"

export default async function Home() {
  const session = await getServerSession()
  if (session?.user) {
    return redirect(ROUTES.DashBoard)
  }

  return redirect(ROUTES.Evaluation)
}

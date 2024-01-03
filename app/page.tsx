"use server"
import { redirect } from "next/navigation"
import { ROUTES } from "@/lib/constants"
import { auth } from "auth"

export default async function Home() {
  const session = await auth()
  if (session?.user) {
    return redirect(ROUTES.DashBoard)
  }

  return redirect(ROUTES.Evaluation)
}

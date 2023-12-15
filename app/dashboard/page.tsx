import { getServerSession } from "next-auth"
import { redirect } from "next/navigation"
import { ROUTES } from "@/lib/constants"
import { CareerResults } from "./career-results"
import { getCareers } from "../actions/server"

export default async function Page() {
  const session = await getServerSession()
  const careers = await getCareers()
  if (!session?.user) {
    return redirect(ROUTES.Login)
  }
  return (
    <div className="w-full justify-center text-left">
      <CareerResults user={session?.user} careers={careers} />
    </div>
  )
}

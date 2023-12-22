import { getServerSession } from "next-auth"
import { redirect } from "next/navigation"
import { ROUTES } from "@/lib/constants"
import { CareerResults } from "./career-results"
import { getCareers } from "../actions/server"
import { isCompanyUser } from "../actions/user"

export default async function Page() {
  const session = await getServerSession()
  const careers = await getCareers()
  const isCompany = await isCompanyUser(session?.user?.email)
  if (!session?.user) {
    return redirect(ROUTES.Login)
  }

  if (isCompany) return redirect(ROUTES.Trainings)

  const careersRes = careers.map((c) => ({ ...c, rating: 30 }))
  return (
    <div className="w-full justify-center text-left">
      <CareerResults user={session?.user} careers={careersRes} />
    </div>
  )
}

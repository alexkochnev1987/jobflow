import { redirect } from "next/navigation"
import { ROUTES } from "@/lib/constants"
import { CareerResults } from "./career-results"
import { getCareers } from "../actions/careers"
import { isCompanyUser } from "../actions/user"
import { auth } from "auth"

export default async function Page() {
  const session = await auth()
  if (!session?.user) {
    return redirect(ROUTES.Login)
  }

  const isCompany = await isCompanyUser(session?.user?.email)

  if (isCompany) return redirect(ROUTES.Trainings)

  const careers = await getCareers()
  const careersRes = careers.map((c) => ({ ...c, rating: 30 }))
  return (
    <div className="w-full justify-center text-left">
      <CareerResults user={session?.user} careers={careersRes} />
    </div>
  )
}

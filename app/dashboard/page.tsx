import { redirect } from "next/navigation"
import { ROUTES } from "@/lib/constants"
import { CareerResults } from "./career-results"
import { getCareers } from "../actions/careers"
import { isCompanyUser } from "../actions/user"
import { auth } from "auth"
import { Card } from "@chakra-ui/react"

export default async function Page() {
  const session = await auth()
  console.log(session, "session")

  if (!session?.user) {
    return redirect(ROUTES.Login)
  }

  const isCompany = await isCompanyUser(session?.user?.email)

  if (isCompany) return redirect(ROUTES.Trainings)

  const careers = await getCareers()
  const careersRes = careers.map((c) => ({ ...c, rating: 30 }))
  return (
    <Card className="w-m-full mx-5 justify-center py-24 text-left !shadow-none">
      <CareerResults user={session?.user} careers={careersRes} />
    </Card>
  )
}

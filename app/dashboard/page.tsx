import { getServerSession } from "next-auth"
import { redirect } from "next/navigation"
import { ROUTES } from "@/lib/constants"
import { CareerResults } from "./career-results"
import { getCareers } from "../actions/server"
import { isCompanyUser } from "../actions/user"
import { revalidatePath } from "next/cache"

export default async function Page() {
  const session = await getServerSession()
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

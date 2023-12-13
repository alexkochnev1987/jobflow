import { getServerSession } from "next-auth"
import { ProfileTabs } from "./profile"
import { redirect } from "next/navigation"
import { ROUTES } from "@/lib/constants"

export default async function Page() {
  const session = await getServerSession()
  if (!session?.user) {
    return redirect(ROUTES.Login)
  }
  return (
    <div className="w-full justify-center text-left">
      <ProfileTabs user={session?.user} />
    </div>
  )
}

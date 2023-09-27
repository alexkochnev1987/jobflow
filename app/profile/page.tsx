import { getServerSession } from "next-auth"
import { ProfileTabs } from "./profile"
import { redirect } from "next/navigation"

export default async function Page() {
  const session = await getServerSession()
  if (!session?.user) {
    return redirect("/jobflow/login")
  }
  return (
    <div className="w-full justify-center text-center">
      <ProfileTabs />
    </div>
  )
}

import Results from "@/components/results"
import { getServerSession } from "next-auth"
import { redirect } from "next/navigation"

export default async function Page() {
  const session = await getServerSession()
  if (session?.user) {
    return redirect("/jobflow/profile")
  }
  return <Results />
}

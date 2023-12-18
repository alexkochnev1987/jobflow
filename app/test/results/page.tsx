import Results from "@/components/results"
import { ROUTES } from "@/lib/constants"
import { getServerSession } from "next-auth"
import { redirect } from "next/navigation"

export default async function Page() {
  return (
    <div className="m-auto flex flex-col justify-center align-middle">
      <Results />
    </div>
  )
}

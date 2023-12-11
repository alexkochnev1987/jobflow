import { getServerSession } from "next-auth"
import { redirect } from "next/navigation"
import { ROUTES } from "@/lib/constants"

// Test page to test components

export default async function Page() {

  return (
    <div className="w-full justify-center text-center">
      <>test</>
    </div>
  )
}

import Results from "@/components/results"
import { getCareers } from "../actions/server"

export default async function Page() {
  const careers = await getCareers()
  console.log(careers)
  return <Results careers={careers} />
}

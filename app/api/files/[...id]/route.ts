import { getImage } from "@/lib/directus"
import { NextRequest } from "next/server"

export async function GET(req: NextRequest) {
  const { pathname } = req.nextUrl
  // get id from pathname
  const id = pathname.split("/").pop()
  console.log(id)
  const result = await getImage(id)

  console.log(result)
  return new Response(result)
}

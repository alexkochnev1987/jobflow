import { getImage } from "@/lib/directus"
import { NextRequest } from "next/server"

export async function GET(req: NextRequest) {
  const { pathname } = req.nextUrl
  // get id from pathname
  const id = pathname.split("/").pop()
  console.log(id)
  if (!id) {
    return new Response("Not found", { status: 404 })
  }
  const result = await getImage(id)

  console.log(result)
  return new Response(result, {
    headers: {
      "Cache-Control": "public, max-age=31536000, immutable",
    },
  })
}

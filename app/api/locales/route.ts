import directus from "@/lib/directus"
import { createTranslation, readTranslations } from "@directus/sdk"
import { NextRequest } from "next/server"

export async function GET(req: NextRequest) {
  if (req.nextUrl.searchParams.get("lng")) {
    const result = await directus.request(
      readTranslations({
        fields: ["key", "value"],
      }),
    )

    const trasnlation = result.reduce((acc, cur) => {
      acc[cur.key] = cur.value
      return acc
    }, {})

    // const translations = result.map((t) => ({ [t.key]: t.value }))
    return new Response(JSON.stringify(trasnlation), {
      status: 200,
    })
  }

  return new Response("Not found", {
    status: 404,
  })
}

export async function POST(req: NextRequest) {
  const data = await req.json()
  // data is a key value pair save the trasnlation to directus

  try {
    for (const [key, value] of Object.entries(data)) {
      // console.log(`${key}: ${value}`)
      await directus.request(
        createTranslation({
          key: key,
          value: value as string,
          language: "de",
        }),
      )
    }
  } catch (error) {}

  return new Response(data, {
    status: 200,
  })
}

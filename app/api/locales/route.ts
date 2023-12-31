import directus from "@/lib/directus"
import { createTranslation, readTranslations } from "@directus/sdk"
import { NextRequest } from "next/server"

import l18n from "@/i18n/config"

export async function GET(req: NextRequest) {
  // send locales/de/translations.json
  const data = require("../../../locales/de/translations.json")

  return new Response(data, {
    status: 200,
  })
}

export async function POST(req: NextRequest) {
  const data = await req.json()
  // data is a key value pair save the trasnlation to directus
  for (const [key, value] of Object.entries(data)) {
    l18n.t(key, value as string)
  }

  return new Response(data, {
    status: 200,
  })
}

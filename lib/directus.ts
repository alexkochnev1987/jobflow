import { authentication, createDirectus, graphql, readAssetRaw, rest } from "@directus/sdk"

const directus = createDirectus(`https://${process.env.DIRECTUS_SERVER}`)
  .with(graphql())
  .with(rest())
  .with(authentication())

  directus.setToken(process.env.DIRECTUS_API_TOKEN as string)


export async function getImage(fileId: string) {
  console.log("getImage", fileId)
  return directus.request(readAssetRaw(fileId));
}


export default directus

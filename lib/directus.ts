import { authentication, createDirectus, graphql, readAssetRaw, rest } from "@directus/sdk"

const client = createDirectus("https://directus.shiftyourcareer.de")
  .with(graphql())
  .with(rest())
  .with(authentication())

client.setToken(process.env.DIRECTUS_API_TOKEN as string)


export async function getImage(fileId: string) {
  console.log("getImage", fileId)
  return client.request(readAssetRaw(fileId));
}


export default client

import { authentication, createDirectus, readAssetRaw, rest, uploadFiles } from "@directus/sdk"

const directus = createDirectus(`https://${process.env.DIRECTUS_SERVER}`)
  .with(rest())
  .with(authentication())

directus.setToken(process.env.DIRECTUS_API_TOKEN as string)


export async function uploadFormData(formData: FormData) {
  return directus.request(uploadFiles(formData))
}
export async function getImage(fileId: string) {
  console.log("getImage", fileId)
  return directus.request(readAssetRaw(fileId));
}


export default directus

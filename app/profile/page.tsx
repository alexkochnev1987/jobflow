import { Flex } from "@radix-ui/themes"

import Timeout from "@/components/shared/timeout"
export default async function Profile({
  searchParams,
}: {
  params: { slug: string }
  searchParams: { [key: string]: string | string[] | undefined }
}) {
  return (
    <>
      <div className="z-10 w-full max-w-5xl px-5 xl:px-0">
        <Flex direction="column" gap="3" align="start">
          <Timeout />
          <p>
            Ihre Antworten wurden von einer K.I. analysiert. Das soeben
            abgeschlossene Assessment wird von Unternehmen, Universitäten und
            Karrierecoaches auf der ganzen Welt verlangt.
          </p>
        </Flex>
      </div>
    </>
  )
}

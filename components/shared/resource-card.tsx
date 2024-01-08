import * as React from "react"

import l18n from "@/i18n/config"
import { Card, Flex } from "@radix-ui/themes"
import Link from "next/link"
import { getImageFullUrl } from "@/lib/utils"

export type Resource = {
  name: string
  file: string
  description: string
}

type Props = React.ComponentPropsWithoutRef<"div"> & Resource

export default function ResourceCard({ name, description, file }: Props) {
  return (
    <Card>
      <Flex direction="column" gap="2">
        <h2 className="text-base font-semibold leading-normal">{name}</h2>
        <div
          className="text-base font-normal leading-normal"
          dangerouslySetInnerHTML={{ __html: description }}
        />
        <Link
          href={getImageFullUrl(file)}
          prefetch={false}
          className="text-sm font-semibold leading-tight text-emerald-300"
        >
          {l18n.t("view-course.download", "Download")}
        </Link>
      </Flex>
    </Card>
  )
}

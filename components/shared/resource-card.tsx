import * as React from "react"

import l18n from "@/i18n/config"
import { Card, Flex } from "@radix-ui/themes"
import Link from "next/link"

export type Resource = {
  name: string
  url: string
  description: string
}

type Props = React.ComponentPropsWithoutRef<"div"> & Resource

export default function ResourceCard({ name, description, url }: Props) {
  return (
    <Card>
      <Flex direction="column" gap="2">
        <h2 className="text-base font-semibold leading-normal">{name}</h2>
        <p className="text-base font-normal leading-normal">{description}</p>
        <Link
          href={url}
          prefetch={false}
          className="text-sm font-semibold leading-tight text-emerald-300"
        >
          Download
        </Link>
      </Flex>
    </Card>
  )
}

import * as React from "react"

import Skeleton from "react-loading-skeleton"

import Clock from "@/icons/clock.svg"
import { convertMinsToHrsMins } from "@/lib/utils"
import l18n from "@/i18n/config"
import Link from "next/link"
import { Badge } from "@radix-ui/themes"
import { ROUTES } from "@/lib/constants"

export type Test = {
  name: string
  duration: Date | number
  description: string
  type: string
}

type Props = React.ComponentPropsWithoutRef<"div"> &
  Test & {
    isLoading?: boolean
  }

export default function TestCard({
  id,
  name,
  duration,
  description,
  type,
  isLoading,
}: Props) {
  if (isLoading) {
    return (
      <Skeleton className="h-23 w-full" height={50} width={300} count={1} />
    )
  }
  return (
    <Link href={ROUTES.ViewTest(id)}>
      <div className="min-w-[300px] cursor-pointer md:w-1/2 lg:w-1/3">
        <div className="border-grey-300 flex min-h-full flex-col items-end rounded-2xl border border-solid bg-white p-6 shadow-sm">
          <div className="mt-1 h-16 self-stretch text-md font-bold leading-8 text-black  max-md:max-w-full">
            {name}
          </div>
          <div className="mt-1.5 flex items-center gap-2 self-start">
            <Badge color="green" radius="full" className="w-40"> 
              {type}  
            </Badge>
          </div>
          <div className="mt-1.5 flex items-center gap-2 self-start">
            <Clock className="fill-slate-700" />
            <div className="grow self-stretch whitespace-nowrap text-sm leading-6 text-slate-700">
              <span className=""> {convertMinsToHrsMins(duration)}</span>
            </div>
          </div>
          <div className="mt-4 self-stretch text-sm leading-6 text-slate-700 max-md:max-w-full line-clamp-5">
            {description}
          </div>
        </div>
      </div>
    </Link>
  )
}

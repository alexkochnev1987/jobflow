import * as React from "react"

import Skeleton from "react-loading-skeleton"

import Clock from "@/icons/clock.svg"
import { convertMinsToHrsMins } from "@/lib/utils"

export type Test = {
  name: string
  time: number
  description: string
}

type Props = React.ComponentPropsWithoutRef<"div"> &
  Test & {
    isLoading?: boolean
  }

export default function TestCard({
  name,
  time,
  description,
  isLoading,
}: Props) {
  if (isLoading) {
    return (
      <Skeleton className="h-23 w-full" height={50} width={300} count={1} />
    )
  }
  return (
    <div className="md:w-1/2 lg:w-1/3 ">
      <div className="border-grey-300 ml-2  flex min-h-full flex-col items-end rounded-2xl border border-solid bg-white p-6 shadow-sm">
        <div className="mt-1 h-16 self-stretch text-xl font-bold leading-8 text-black  max-md:max-w-full">
          {name}
        </div>
        <div className="mt-1.5 flex items-center gap-2 self-start">
          <Clock className="fill-slate-700" />
          <div className="grow self-stretch whitespace-nowrap text-sm leading-6 text-slate-700">
            <span className=""> {convertMinsToHrsMins(time)}</span>
          </div>
        </div>
        <div className="mt-4 self-stretch text-sm leading-6 text-slate-700 max-md:max-w-full">
          {description}
        </div>
      </div>
    </div>
  )
}
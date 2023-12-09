import React from "react"
import { Badge } from "@radix-ui/themes"
import { Info } from "lucide-react"
import Bookmark from "@/components/shared/icons/bookmark.svg"
import Currency from "@/components/shared/icons/currency.svg"
import Clock from "@/components/shared/icons/clock.svg"
import Computer from "@/components/shared/icons/pc.svg"
import Image from "next/image"

type Props = React.ComponentPropsWithoutRef<"div"> & {
  isLoading?: boolean
  data?: any
}

function JobListing({ data }: Props) {
  const raitingColor =
    data.rating < 40 ? "ruby" : data.rating < 80 ? "yellow" : "green"
  return (
    <div className="flex flex-col items-stretch rounded-2xl border border-solid border-[color:var(--grey-300,#D0D5DD)] bg-white shadow-sm">
      <Image
        loading="lazy"
        className="aspect-[3.11] w-full overflow-hidden object-contain object-center"
        src="/career-img-placeholder.png"
        height={115}
        width={261}
        alt=""
      />
      <div className="mt-4 flex w-full flex-col items-stretch px-6 pb-6">
        <header className="whitespace-nowrap text-lg font-bold leading-7 text-black">
          UX-Designer
        </header>
        <div className="mt-5 flex items-center justify-between gap-2 pr-20">
          <Currency className="fill-slate-700" />
          <div className="grow self-stretch whitespace-nowrap text-sm leading-6 text-slate-700">
            <span className="font-semibold">Salary:</span>{" "}
            <span className=""> 37.000 - 65.000 €</span>
          </div>
        </div>
        <div className="mt-1.5 flex items-center justify-between gap-2 pr-20">
          <Clock className="fill-slate-700" />
          <div className="grow self-stretch whitespace-nowrap text-sm leading-6 text-slate-700">
            <span className="font-semibold">Pace:</span>{" "}
            <span className=""> Part-Time, Full-Time</span>
          </div>
        </div>
        <div className="mt-1.5 flex items-center justify-between gap-2 pr-20">
          <Computer className="stroke-slate-700" />
          <div className="grow self-stretch whitespace-nowrap text-sm leading-6 text-slate-700">
            <span className="font-semibold">Format:</span>{" "}
            <span className=""> Online, On Campus</span>
          </div>
        </div>
        <div className="mt-5 flex w-full items-stretch justify-between gap-5">
          <div className="flex w-full items-start justify-between py-2">
            <Badge color={raitingColor} radius="full">
              {data.rating}% Match <Info className="w-4" />
            </Badge>
            <Bookmark className="stroke-slate-700" />
          </div>
        </div>
      </div>
    </div>
  )
}

export default JobListing

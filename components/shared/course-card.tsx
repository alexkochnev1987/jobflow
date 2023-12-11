import * as React from "react"

import Clock from "@/components/shared/icons/clock.svg"
import Calendar from "@/components/shared/icons/calendar.svg"
import Location from "@/components/shared/icons/location.svg"
import Tag from "@/components/shared/icons/tag.svg"
import Bag from "@/components/shared/icons/bag.svg"
import Image from "next/image"
import Button from "./button"
import { salaryFormatter } from "@/lib/utils"

export type Course = {
  name: string
  startDate: string
  pace: string
  location: string
  price: number
  sponsorship: boolean
  description: string
}

type Props = React.ComponentPropsWithoutRef<"div"> & Course

export default function CourseCard({
  name,
  pace,
  price,
  location,
  description,
  startDate,
  sponsorship,
}: Props) {
  return (
    <div className="flex w-full flex-col items-end rounded-2xl border border-solid border-[color:var(--grey-300,#D0D5DD)] bg-white p-6 shadow-sm max-md:px-5">
      <Image
        height={120}
        width={120}
        className="shrink grow basis-0 self-stretch"
        src="https://placehold.co/120x120"
        placeholder="empty"
        alt=""
      />
      <div className="mt-3 self-stretch whitespace-nowrap text-left text-xs font-medium leading-5 text-gray-500 max-md:max-w-full">
        COURSE
      </div>
      <div className="mt-1 self-stretch text-xl font-bold leading-8 text-black max-md:max-w-full">
        {name}
      </div>
      <div className="mt-1 flex items-center gap-2 self-start px-px">
        <Calendar />
        <div className="text-sm font-medium leading-5 text-slate-700">
          <span className="font-semibold">Start date:</span>
          <span className="capitalize"> {startDate}</span>
        </div>
      </div>
      <div className="mt-1.5 flex items-center gap-2 self-start">
        <Clock className="fill-slate-700" />
        <div className="grow self-stretch whitespace-nowrap text-sm leading-6 text-slate-700">
          <span className="font-semibold">Pace:</span>
          <span className=""> {pace}</span>
        </div>
      </div>
      <div className="mt-1.5 flex items-center gap-2 self-start pr-14 max-md:pr-5">
        <Location />
        <div className="grow self-stretch whitespace-nowrap text-sm leading-6 text-slate-700">
          <span className="font-semibold">Location:</span>
          <span className=""> {location}</span>
        </div>
      </div>
      <div className="mt-1.5 flex items-center gap-2 self-start">
        <Tag />
        <div className="grow self-stretch whitespace-nowrap text-sm leading-6 text-slate-700">
          <span className="font-semibold">Price: </span>
          <span className=""> {salaryFormatter(price)} €</span>
        </div>
      </div>
      <div className="ml-5 mt-1 self-start whitespace-nowrap text-sm leading-6 text-sky-500 max-md:ml-2.5">
        Want it for free?
      </div>
      <div className="mt-1.5 flex items-center gap-2 self-start pr-7 max-md:pr-5">
        <Bag />
        <div className="grow self-stretch whitespace-nowrap text-sm leading-6 text-slate-700">
          <span className="font-semibold">Sponsorship:</span>
          <span className=""> {sponsorship ? "Yes" : "No"}</span>
        </div>
      </div>
      <div className="mt-4 self-stretch text-sm leading-6 text-slate-700 max-md:max-w-full">
        {description}
      </div>
      <div className="mt-8 flex items-stretch justify-between gap-2.5 self-stretch max-md:max-w-full max-md:flex-wrap">
        <Button intent="outlined">Contact</Button>
        <Button intent="primary" className="bg-sky-500">
          Enroll
        </Button>
      </div>
    </div>
  )
}

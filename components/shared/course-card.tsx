import * as React from "react"

import Skeleton from "react-loading-skeleton"

import Clock from "@/icons/clock.svg"
import Calendar from "@/icons/calendar.svg"
import Location from "@/icons/location.svg"
import Tag from "@/icons/tag.svg"
import Bag from "@/icons/bag.svg"
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

type Props = React.ComponentPropsWithoutRef<"div"> &
  Course & {
    isLoading?: boolean
  }

export default function CourseCard({
  name,
  pace,
  price,
  location,
  description,
  startDate,
  sponsorship,
  isLoading,
}: Props) {
  if (isLoading) {
    return (
      <Skeleton className="h-23 w-full" height={50} width={300} count={1} />
    )
  }
  return (
    <div className="min-h-full px-1 md:px-2 md:w-1/2 lg:w-1/3 mt-2">
      <div className="border-grey-300 flex h-full  flex-col  rounded-2xl border border-solid bg-white p-2 shadow-sm min-h-[200px]">
        <Image
          height={120}
          width={120}
          src="https://placehold.co/120x120"
          placeholder="empty"
          alt=""
        />
        <div className="mt-3 self-stretch whitespace-nowrap text-left text-xs font-medium leading-5 text-gray-500 max-md:max-w-full">
          COURSE
        </div>
        <div className="mt-1 self-stretch text-xl font-bold leading-8 text-black max-md:max-w-full h-16">
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
        <div className="mt-4 self-stretch text-sm leading-6 text-slate-700 max-md:max-w-full h-28">
          {description}
        </div>
        <div className="flex flex-row justify-between gap-1 self-stretch items-end">
          <Button intent="primary" className="bg-rose-500 hover:bg-rose-400">
            Enroll
          </Button>
        </div>
      </div>
    </div>
  )
}

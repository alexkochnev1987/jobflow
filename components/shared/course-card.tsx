/* eslint-disable @next/next/no-img-element */
import * as React from "react"

import Skeleton from "react-loading-skeleton"

import Clock from "@/icons/clock.svg"
import Calendar from "@/icons/calendar.svg"
import Location from "@/icons/location.svg"
import Tag from "@/icons/tag.svg"
import Bag from "@/icons/bag.svg"
import Button from "./button"
import {
  formatArray,
  formatDateString,
  getImageFullUrl,
  salaryFormatter,
} from "@/lib/utils"
import ContactModal from "../courses/contact-modal"

export type Course = {
  name: string
  start_date?: Date
  pace: string[]
  location: string
  price: number
  sponsorship: boolean
  description: string
  image?: string
}

type Props = React.ComponentPropsWithoutRef<"div"> &
  Course & {
    isLoading?: boolean
  }

export default function CourseCard({
  id,
  name,
  pace,
  image,
  price,
  location,
  description,
  start_date,
  sponsorship,
  isLoading,
}: Props) {
  if (isLoading) {
    return (
      <Skeleton className="h-23 w-full" height={50} width={300} count={1} />
    )
  }
  return (
    <div className="min-h-full min-w-[300px] self-stretch px-1 md:w-1/2 lg:w-1/3">
      <div className="border-grey-300 flex h-full  min-h-[200px]  flex-col rounded-2xl border border-solid bg-white p-2 shadow-md ">
        <img
          height={120}
          width={120}
          src={getImageFullUrl(image)}
          placeholder="empty"
          alt=""
          className="rounded-xl object-cover"
        />
        <div className="mt-3 self-stretch whitespace-nowrap text-left text-xs font-medium leading-5 text-gray-500 max-md:max-w-full">
          COURSE
        </div>
        <div className="mt-1 h-16 self-stretch text-xl font-bold leading-8 text-black max-md:max-w-full">
          {name}
        </div>
        <div className="mt-1 flex items-center gap-2 self-start px-px">
          <Calendar />
          <div className="text-sm font-medium leading-5 text-slate-700">
            <span className="font-semibold">Start date:</span>
            <span className="capitalize"> {formatDateString(start_date)}</span>
          </div>
        </div>
        <div className="mt-1.5 flex items-center gap-2 self-start">
          <Clock className="fill-slate-700" />
          <div className="grow self-stretch whitespace-nowrap text-sm leading-6 text-slate-700">
            <span className="font-semibold">Pace:</span>
            <span className=""> {formatArray(pace)}</span>
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
        <div className="mt-4 h-28 self-stretch text-sm leading-6 text-slate-700 max-md:max-w-full">
          {description}
        </div>
        <div className="flex flex-row items-end justify-between gap-1 self-stretch">
          <ContactModal />
        </div>
      </div>
    </div>
  )
}

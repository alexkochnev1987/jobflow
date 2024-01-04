/* eslint-disable @next/next/no-img-element */
import * as React from "react"

import Skeleton from "react-loading-skeleton"

import Clock from "@/icons/clock.svg"
import Calendar from "@/icons/calendar.svg"
import Location from "@/icons/location.svg"
import Tag from "@/icons/tag.svg"
import Bag from "@/icons/bag.svg"

import {
  formatArray,
  formatDateString,
  getImageFullUrl,
  salaryFormatter,
} from "@/lib/utils"
import l18n from "@/i18n/config"
import { Button } from "@radix-ui/themes"
import { useRouter } from "next/navigation"
import { ROUTES } from "@/lib/constants"

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
  const router = useRouter()

  if (isLoading) {
    return (
      <Skeleton className="h-23 w-full" height={50} width={300} count={1} />
    )
  }

  const handleClick = () => {
    router.push(ROUTES.ViewCourse(id))
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
          {l18n.t("COURSE")}
        </div>
        <div className="mt-1 h-16 self-stretch text-xl font-bold leading-8 text-black max-md:max-w-full">
          {l18n.t(name)}
        </div>
        <div className="mt-1 flex items-center gap-2 self-start px-px">
          <Calendar />
          <div className="text-sm font-medium leading-5 text-slate-700">
            <span className="font-semibold">{l18n.t("Start date:")}</span>
            <span className="capitalize"> {formatDateString(start_date)}</span>
          </div>
        </div>
        <div className="mt-1.5 flex items-center gap-2 self-start">
          <Clock className="fill-slate-700" />
          <div className="grow self-stretch whitespace-nowrap text-sm leading-6 text-slate-700">
            <span className="font-semibold">{l18n.t("Pace:")}</span>
            <span className=""> {formatArray(pace)}</span>
          </div>
        </div>
        <div className="mt-1.5 flex items-center gap-2 self-start pr-14 max-md:pr-5">
          <Location />
          <div className="grow self-stretch whitespace-nowrap text-sm leading-6 text-slate-700">
            <span className="font-semibold">{l18n.t("Location:")}</span>
            <span className=""> {l18n.t(location)}</span>
          </div>
        </div>
        <div className="mt-1.5 flex items-center gap-2 self-start">
          <Tag />
          <div className="grow self-stretch whitespace-nowrap text-sm leading-6 text-slate-700">
            <span className="font-semibold">{l18n.t("Price:")} </span>
            <span className=""> {salaryFormatter(price)} €</span>
          </div>
        </div>
        <div className="ml-5 mt-1 self-start whitespace-nowrap text-sm leading-6 text-sky-500 max-md:ml-2.5">
          {l18n.t("Want it for free?")}
        </div>
        <div className="mt-1.5 flex items-center gap-2 self-start pr-7 max-md:pr-5">
          <Bag />
          <div className="grow self-stretch whitespace-nowrap text-sm leading-6 text-slate-700">
            <span className="font-semibold">{l18n.t("Sponsorship:")}</span>
            <span className="">
              {" "}
              {sponsorship ? l18n.t("Yes") : l18n.t("No")}
            </span>
          </div>
        </div>
        <div className="mt-4 h-28 self-stretch text-sm leading-6 text-slate-700 max-md:max-w-full">
          {l18n.t(description)}
        </div>
        <div className="flex flex-row items-end justify-between gap-1 self-stretch">
          <Button
            onClick={handleClick}
            variant="solid"
            size="4"
            className="my-4 w-full !bg-rose-500 hover:!bg-rose-400"
          >
            Unverbindlich anfragen
          </Button>
        </div>
      </div>
    </div>
  )
}

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
import { Button, Flex, Grid } from "@radix-ui/themes"
import { useRouter } from "next/navigation"
import { ROUTES } from "@/lib/constants"
import ContactModal from "../courses/contact-modal"

export type Contact = {
  id: string
  avatar: string
  first_name: string
  last_name: string
}

export type Company = {
  id: string
  logo: string
  Contact?: Contact
}

export type Course = {
  name: string
  start_date?: Date
  pace: string[]
  location: string
  price: number
  sponsorship: boolean
  description: string
  image?: string
  Company?: Company
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
  Company,
}: Props) {
  if (isLoading) {
    return (
      <Skeleton className="h-23 w-full" height={50} width={300} count={1} />
    )
  }

  return (
    <div className="mr-5 min-h-full self-stretch px-1">
      <div className="border-grey-300 flex h-full w-full flex-col rounded-2xl border border-solid bg-white p-2 shadow-md ">
        <Flex className="mb-5 flex-col gap-0 md:flex-row md:gap-5">
          <img
            height={120}
            width={120}
            src={getImageFullUrl(image)}
            placeholder="empty"
            alt=""
            className="rounded-xl object-cover"
          />
          <Flex direction="column">
            <div className="mt-3 self-stretch whitespace-nowrap text-left text-xs font-medium leading-5 text-gray-500 max-md:max-w-full">
              {l18n.t("course.card.title", "COURSE")}
            </div>
            <div className="text-md mt-1 self-stretch font-bold leading-8 text-black max-md:max-w-full">
              {name}
            </div>
          </Flex>
        </Flex>
        <Grid className="grid-col-1 md:grid-col-2 mt-5" gap="1" width="auto">
          <div className="mt-1 flex items-center gap-2 self-start px-px">
            <Calendar />
            <div className="text-sm font-medium leading-5 text-slate-700">
              <span className="font-semibold">
                {l18n.t("course.card.start", "Start date:")}
              </span>
              <span className="capitalize">
                {" "}
                {formatDateString(start_date)}
              </span>
            </div>
          </div>
          <div className="mt-1.5 flex items-center gap-2 self-start">
            <Clock className="fill-slate-700" />
            <div className="grow self-stretch whitespace-nowrap text-sm leading-6 text-slate-700">
              <span className="font-semibold">
                {l18n.t("course.card.pace", "Pace:")}
              </span>
              <span className=""> {formatArray(pace)}</span>
            </div>
          </div>
          <div className="mt-1.5 flex items-center gap-2 self-start pr-14 max-md:pr-5">
            <Location />
            <div className="grow self-stretch whitespace-nowrap text-sm leading-6 text-slate-700">
              <span className="font-semibold">
                {l18n.t("course.card.location", "Location:")}
              </span>
              <span className=""> {l18n.t(location)}</span>
            </div>
          </div>
          <div className="mt-1.5 flex items-center gap-2 self-start">
            <Tag />
            <div className="grow self-stretch whitespace-nowrap text-sm leading-6 text-slate-700">
              <span className="font-semibold">
                {l18n.t("course.card.price", "Price:")}{" "}
              </span>
              <span className=""> {salaryFormatter(price)} €</span>
            </div>
          </div>
          <div className="mt-1.5 flex items-center gap-2 self-start pr-7 max-md:pr-5">
            <Bag />
            <div className="grow self-stretch whitespace-nowrap text-sm leading-6 text-slate-700">
              <span className="font-semibold">{l18n.t("Sponsorship:")}</span>
              <span className="">
                {" "}
                {sponsorship
                  ? l18n.t("course.card.sponsorship.yes", "Yes")
                  : l18n.t("course.card.sponsorship.no", "No")}
              </span>
            </div>
          </div>
          <div className="cursor-pointer self-start whitespace-nowrap text-sm leading-6 text-sky-500">
            {l18n.t("contact.modal.link", "Want it for free?")}
          </div>
        </Grid>
        <div className="mt-4 self-stretch text-sm leading-6 text-slate-700 max-md:max-w-full">
          {description}
        </div>
        <div className="flex flex-row items-end justify-between gap-1 self-stretch">
          <ContactModal company={Company} />
        </div>
      </div>
    </div>
  )
}

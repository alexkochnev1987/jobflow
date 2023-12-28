/* eslint-disable @next/next/no-img-element */
"use client"
import { formatArray, getImageFullUrl, salaryFormatter } from "@/lib/utils"
import { Badge, Button } from "@radix-ui/themes"
import { Info } from "lucide-react"
import Image from "next/image"
import Skeleton from "react-loading-skeleton"
import Bookmark from "@/icons/bookmark.svg"
import Currency from "@/icons/currency.svg"
import Clock from "@/icons/clock.svg"
import Computer from "@/icons/pc.svg"
import React from "react"
import { useRouter } from "next/navigation"

export type Career = {
  id: string
  image?: string
  name: string
  description: string
  detailsFuture?: string
  detailsRequirement?: string
  detailsSkills?: string
  detailsTasks?: string
  retrainingWeeks: number
  rating?: number
  salaryMin?: number
  salaryMax?: number
  pace?: string[] | string | any
  format?: string[] | string | any
  Careers_Courses: any[]
  Careers_Quizzes: any[]
}

type Props = React.ComponentPropsWithoutRef<"div"> & {
  isLoading?: boolean
  data?: Career
}

export default function CareerCard({ isLoading, data }: Props) {
  const router = useRouter()

  function onClick() {
    const url = `/dashboard/career/${data.id}`
    router.push(url)
  }

  const raitingColor =
    data.rating < 40 ? "ruby" : data.rating < 80 ? "yellow" : "green"
  return (
    <div
      className="w-full flex-col items-start justify-start p-4 hover:cursor-pointer  md:w-1/2 lg:w-1/3"
      onClick={onClick}
    >
      <div className="min-w-[250px] overflow-hidden rounded-2xl border border-gray-300 bg-white shadow">
        <div className="relative h-28 w-full">
          <img
            src={getImageFullUrl(data.image)}
            alt=""
            className="h-full w-full object-cover"
          />
        </div>
        <div className="flex h-48 flex-col items-start justify-start gap-3 self-stretch p-4">
          {isLoading && (
            <div className="w-full">
              <Skeleton className="w-full" count={4} />
            </div>
          )}
          {!isLoading && (
            <>
              <div className="w-full text-lg font-bold leading-7 text-black">
                {data.name}
              </div>

              <p className="flex  justify-center gap-1 align-middle">
                <Currency className="fill-slate-700" />
                <span className="text-sm font-semibold leading-tight text-slate-700">
                  Salary:{" "}
                </span>
                <span className="text-sm font-normal leading-snug text-slate-700">
                  {salaryFormatter(data.salaryMin)} -{" "}
                  {salaryFormatter(data.salaryMax)} €
                </span>
              </p>
              <p className="flex  justify-center gap-1 align-middle">
                <Clock className="fill-slate-700" />
                <span className="text-sm font-semibold leading-tight text-slate-700">
                  Pace:{" "}
                </span>
                <span className="text-sm font-normal leading-snug text-slate-700">
                  {formatArray(data.pace)}
                </span>
              </p>
              <p className="flex  justify-center gap-1 align-middle">
                <Computer className="stroke-slate-700" />
                <span className="text-sm font-semibold leading-tight text-slate-700">
                  Format:{" "}
                </span>
                <span className="text-sm font-normal leading-snug text-slate-700">
                  {formatArray(data.format)}
                </span>
              </p>
            </>
          )}
          <div className="flex w-full items-start justify-between py-2">
            {!isLoading && (
              <>
                <Badge color={raitingColor} radius="full">
                  {data.rating}% Match <Info className="w-4" />
                </Badge>
                <Button variant="ghost">
                  <Bookmark className="stroke-slate-700" />
                </Button>
              </>
            )}
            {isLoading && (
              <>
                <Skeleton className="h-4 w-32" count={1} />
                <Skeleton className="h-4 w-8" count={1} />
              </>
            )}
          </div>
        </div>
      </div>
    </div>
  )
}

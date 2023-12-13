"use client"
import { salaryFormatter } from "@/lib/utils"
import { Badge, Button } from "@radix-ui/themes"
import { Info } from "lucide-react"
import Image from "next/image"
import Skeleton from "react-loading-skeleton"
import Bookmark from "@/icons/bookmark.svg"
import Currency from "@/icons/currency.svg"
import Clock from "@/icons/clock.svg"
import Computer from "@/icons/pc.svg"
import React from "react"

export type Career = {
  uid: string
  career: string
  rating: number
  salaryMin: number
  salaryMax: number
  pace: string
  format: string
}

type Props = React.ComponentPropsWithoutRef<"div"> & {
  isLoading?: boolean
  data?: Career
}

export default function CareerCard({ isLoading, data }: Props) {
  const raitingColor =
    data.rating < 40 ? "ruby" : data.rating < 80 ? "yellow" : "green"
  return (
    <div className="p-4 w-full flex-col items-start justify-start md:w-1/2  lg:w-1/3">
      <div className="overflow-hidden rounded-2xl border border-gray-300 bg-white shadow ">
        <div className="relative h-28 w-full">
          <Image
            fill
            src="https://placehold.co/520x330"
            alt=""
            blurDataURL="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAMAAAADA..."
            placeholder="blur"
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
                {data.career}
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
                  {data.pace}
                </span>
              </p>
              <p className="flex  justify-center gap-1 align-middle">
                <Computer className="stroke-slate-700" />
                <span className="text-sm font-semibold leading-tight text-slate-700">
                  Format:{" "}
                </span>
                <span className="text-sm font-normal leading-snug text-slate-700">
                  {data.format}
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

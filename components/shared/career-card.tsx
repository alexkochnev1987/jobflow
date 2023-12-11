"use client"
import { salaryFormatter } from "@/lib/utils"
import { Badge, Button } from "@radix-ui/themes"
import { Info } from "lucide-react"
import Image from "next/image"
import Skeleton from "react-loading-skeleton"
import Bookmark from "@/components/shared/icons/bookmark.svg"
import Currency from "@/components/shared/icons/currency.svg"
import Clock from "@/components/shared/icons/clock.svg"
import Computer from "@/components/shared/icons/pc.svg"
import React from "react"

type Props = React.ComponentPropsWithoutRef<"div"> & {
  isLoading?: boolean
  data?: {
    career: string
    rating: number
    salaryMin: number
    salaryMax: number
    pace: string
    format: string
  }
}

export default function CareerCard({ isLoading, data }: Props) {
  const raitingColor =
    data.rating < 40 ? "ruby" : data.rating < 80 ? "yellow" : "green"
  return (
    <div className="w-[260px] flex-col items-start justify-start gap-4 overflow-hidden rounded-2xl border border-gray-300 bg-white shadow">
      <Image
        height={115}
        width={261}
        className="shrink grow basis-0 self-stretch"
        src="https://placehold.co/260x115"
        placeholder="empty"
        alt=""
      />
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
                {salaryFormatter(data.salaryMin)} - {salaryFormatter(data.salaryMax)} €
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
  )
}

"use client"
/* eslint-disable @next/next/no-img-element */
import ChevronMore from "@/icons/ChevronMore.svg"
import Clock from "@/icons/clock.svg"

import Location from "@/icons/location.svg"
import Currency from "@/icons/currency.svg"

import { Badge, Flex } from "@radix-ui/themes"
import { Info } from "lucide-react"
import { Career } from "@/components/shared/career-card"
import { cn, formatArray, getImageFullUrl, salaryFormatter } from "@/lib/utils"
import l18n from "@/i18n/config"
import { Collapsible, CollapsibleContent } from "@/components/ui/collapsible"
import { useState } from "react"

type Props = Partial<Career> &
  React.ComponentPropsWithoutRef<"div"> & {
    isLoading?: boolean
  }

function JobListing({
  id,
  image,
  name,
  description,
  detailsFuture,
  detailsRequirement,
  detailsSkills,
  detailsTasks,
  retrainingWeeks,
  rating,
  salaryMin,
  salaryMax,
  pace,
  format,
}: Props) {
  const [isCollapsed, setIsCollapsed] = useState(false)
  return (
    <div className="flex flex-col items-start self-stretch bg-white py-6">
      <div className="w-[423px] max-w-full">
        <div className="flex gap-5 max-md:flex-col max-md:items-stretch max-md:gap-0">
          <div className="flex w-[48%] flex-col items-stretch max-md:ml-0 max-md:w-full">
            <img
              src={getImageFullUrl(image)}
              className="h-full w-full rounded-2xl object-cover"
              alt=""
            />
          </div>
          <div className="ml-5 flex  flex-col items-stretch max-md:ml-0 max-md:w-full">
            <div className="my-auto flex flex-col px-5 py-0.5 max-md:mt-10">
              <Badge color="green" radius="full" className="w-24">
                {rating}% Match <Info className="w-4" />
              </Badge>
              <div className="mt-3 text-lg font-bold leading-7 text-black">
                {l18n.t(`dashboard.view-career.${id}.name`, name)}
              </div>
              <div className="mt-4 flex items-center justify-between gap-2 pr-2.5">
                <Currency className="fill-slate-700" />
                <div className="grow self-stretch whitespace-nowrap text-sm leading-5 text-slate-700">
                  <span className="font-semibold">
                    {l18n.t(`dashboard.view-career.salary`, "Salary:")}
                  </span>{" "}
                  <span className="font-normal">
                    {salaryFormatter(salaryMin)} - {salaryFormatter(salaryMax)}{" "}
                    €
                  </span>
                </div>
              </div>
              <div className="mt-1.5 flex items-center justify-between gap-2 pr-2">
                <Clock className="fill-slate-700" />
                <div className="grow self-stretch whitespace-nowrap text-sm leading-5 text-slate-700">
                  <span className="font-semibold">
                    {l18n.t(`dashboard.view-career.pace`, "Pace:")}{" "}
                  </span>{" "}
                  <span>{formatArray(pace)}</span>
                </div>
              </div>
              <div className="mt-1.5 flex items-center justify-between gap-2">
                <Location />
                <div className="grow self-stretch whitespace-nowrap text-sm leading-6 text-slate-700">
                  <span className="font-semibold">
                    {l18n.t(`dashboard.view-career.format`, "Format:")}
                  </span>{" "}
                  <span className="">{formatArray(format)}</span>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div className="mt-6 w-full self-stretch text-base leading-6 text-black max-md:max-w-full">
        <p>{l18n.t(`dashboard.view-career.${id}.description`, description)}</p>
      </div>
      <div
        role="button"
        tabIndex={0}
        className="mt-6 flex cursor-pointer items-center gap-0 self-end  px-5"
        onClick={() => setIsCollapsed(!isCollapsed)}
        onKeyDown={() => setIsCollapsed(!isCollapsed)}
      >
        <div className="my-auto grow whitespace-nowrap text-sm font-medium text-emerald-300">
          Show details
        </div>
        <ChevronMore className={cn(!isCollapsed && "rotate-180")} />
      </div>
      <Collapsible open={isCollapsed} className="w-full">
        <CollapsibleContent className="w-full">
          <Flex direction="column" gap="4">
            <Flex direction="row" align="stretch" className="w-full" gap="2">
              <Flex className="w-1/3" direction="column">
                <h1 className="font-bold">
                  {l18n.t(
                    "dashboard.view-career.what-does",
                    "What does a {{name}} do?",
                    {
                      name: l18n.t(name),
                    },
                  )}
                </h1>
                <p dangerouslySetInnerHTML={{ __html: detailsRequirement }} />
              </Flex>
              <Flex className="w-1/3" direction="column">
                <h1 className="font-bold">
                  {l18n.t(
                    "dashboard.view-career.how-become",
                    "How do I become a {{name}}?",
                    {
                      name: l18n.t(name),
                    },
                  )}
                </h1>
                <p dangerouslySetInnerHTML={{ __html: detailsTasks }} />
              </Flex>
              <Flex className="w-1/3" direction="column">
                <h1 className="font-bold">
                  {l18n.t(`dashboard.view-career.skills`, "Skills")}
                </h1>
                <p dangerouslySetInnerHTML={{ __html: detailsSkills }} />
              </Flex>
            </Flex>
            <h1 className="font-bold">
              {l18n.t(
                "dashboard.view-career.future",
                "Future perspective of {{name}}",
                {
                  name: l18n.t(name),
                },
              )}
            </h1>
            <p dangerouslySetInnerHTML={{ __html: detailsFuture }} />
          </Flex>
        </CollapsibleContent>
      </Collapsible>
    </div>
  )
}
export default JobListing

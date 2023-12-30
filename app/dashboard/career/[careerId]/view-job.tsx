/* eslint-disable @next/next/no-img-element */
import ChevronMore from "@/icons/ChevronMore.svg"
import Clock from "@/icons/clock.svg"

import Location from "@/icons/location.svg"
import Currency from "@/icons/currency.svg"

import { Badge } from "@radix-ui/themes"
import { Info } from "lucide-react"
import { Career } from "@/components/shared/career-card"
import { formatArray, getImageFullUrl, salaryFormatter } from "@/lib/utils"
import l18n from "@/i18n/config"

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
                {l18n.t(name)}
              </div>
              <div className="mt-4 flex items-center justify-between gap-2 pr-2.5">
                <Currency className="fill-slate-700" />
                <div className="grow self-stretch whitespace-nowrap text-sm leading-5 text-slate-700">
                  <span className="font-semibold">{l18n.t("Salary:")}</span>{" "}
                  <span className="font-normal">
                    {salaryFormatter(salaryMin)} - {salaryFormatter(salaryMax)}{" "}
                    €
                  </span>
                </div>
              </div>
              <div className="mt-1.5 flex items-center justify-between gap-2 pr-2">
                <Clock className="fill-slate-700" />
                <div className="grow self-stretch whitespace-nowrap text-sm leading-5 text-slate-700">
                  <span className="font-semibold">{l18n.t("Pace:")} </span>{" "}
                  <span>{formatArray(pace)}</span>
                </div>
              </div>
              <div className="mt-1.5 flex items-center justify-between gap-2">
                <Location />
                <div className="grow self-stretch whitespace-nowrap text-sm leading-6 text-slate-700">
                  <span className="font-semibold">{l18n.t("Format:")}</span>{" "}
                  <span className="">{formatArray(format)}</span>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div className="mt-6 w-full self-stretch text-sm leading-6 text-black max-md:max-w-full">
        <p>{l18n.t(description)}</p>
        {/* <h2 className="my-2 text-2xl font-bold">Future</h2>
        <p dangerouslySetInnerHTML={{ __html: detailsFuture }} />
        <h2 className="my-2 text-2xl font-bold">Requirements</h2>
        <p dangerouslySetInnerHTML={{ __html: detailsRequirement }} />
        <h2 className="my-2 text-2xl font-bold">Skills</h2>
        <p dangerouslySetInnerHTML={{ __html: detailsSkills }} />
        <h2 className="my-2 text-2xl font-bold">Tasks</h2>
        <p dangerouslySetInnerHTML={{ __html: detailsTasks }} /> */}
      </div>
      {/* <div className="mt-6 flex items-center gap-0 self-end px-5">
        <div className="my-auto grow whitespace-nowrap text-sm font-medium text-emerald-300">
          Show details
        </div>
        <ChevronMore />
      </div> */}
    </div>
  )
}
export default JobListing

import * as React from "react"

import Clock from "@/components/shared/icons/clock.svg"
import Calendar from "@/components/shared/icons/calendar.svg"
import Location from "@/components/shared/icons/location.svg"
import Tag from "@/components/shared/icons/tag.svg"
import Bag from "@/components/shared/icons/bag.svg"


type Props = React.ComponentPropsWithoutRef<"div"> & {
  name: string
  time: string
  rating: number
  description: string
}

function CourseCard({}: Props) {
  return (
    <div className="flex flex-col items-end rounded-2xl border border-solid border-[color:var(--grey-300,#D0D5DD)] bg-white p-6 shadow-sm max-md:px-5">
      logo
      <div className="mt-3 self-stretch whitespace-nowrap text-center text-xs font-medium leading-5 text-gray-500 max-md:max-w-full">
        COURSE
      </div>
      <div className="mt-1 self-stretch text-xl font-bold leading-8 text-black max-md:max-w-full">
        This is a looonng course name
      </div>
      <div className="mt-1 flex items-center gap-2 self-start px-px">
        <Calendar />
        <div className="text-sm font-medium leading-5 text-slate-700">
          <span className="font-semibold">Start date:</span>
          <span className="font-medium"> </span>
          <span className="">always</span>
        </div>
      </div>
      <div className="mt-1.5 flex items-center gap-2 self-start">
        <Clock />
        <div className="grow self-stretch whitespace-nowrap text-sm leading-6 text-slate-700">
          <span className="font-semibold">Pace:</span>
          <span className=""> Part-Time, Full-Time</span>
        </div>
      </div>
      <div className="mt-1.5 flex items-center gap-2 self-start pr-14 max-md:pr-5">
        <Location />
        <div className="grow self-stretch whitespace-nowrap text-sm leading-6 text-slate-700">
          <span className="font-semibold">Location:</span>
          <span className=""> Remote</span>
        </div>
      </div>
      <div className="mt-1.5 flex items-center gap-2 self-start">
        <Tag />
        <div className="grow self-stretch whitespace-nowrap text-sm leading-6 text-slate-700">
          <span className="font-semibold">Price: e.g.</span>
          <span className=""> 8.800€</span>
        </div>
      </div>
      <div className="ml-5 mt-1 self-start whitespace-nowrap text-sm leading-6 text-sky-500 max-md:ml-2.5">
        Want it for free?
      </div>
      <div className="mt-1.5 flex items-center gap-2 self-start pr-7 max-md:pr-5">
        <Bag />
        <div className="grow self-stretch whitespace-nowrap text-sm leading-6 text-slate-700">
          <span className="font-semibold">Sponsorship:</span>
          <span className=""> Yes / No</span>
        </div>
      </div>
      <div className="mt-4 self-stretch text-sm leading-6 text-slate-700 max-md:max-w-full">
        Quisque a augue ut ante elementum condimentum. Suspendisse at pretium
        felis. Nulla facilisi. Pellentesque vel ipsum velit. Vivamus vulputate
        sapien a est aliquet bibendum.
      </div>
      <div className="mt-8 flex items-stretch justify-between gap-2.5 self-stretch max-md:max-w-full max-md:flex-wrap">
        <div className="grow items-center justify-center whitespace-nowrap rounded border border-solid border-[color:var(--borders-input,#D0D5DD)] bg-white px-16 py-2.5 text-base font-semibold leading-6 text-black shadow-sm max-md:px-5">
          Contact
        </div>
        <div className="grow items-center justify-center whitespace-nowrap rounded border border-solid border-[color:var(--buttons-primary-bg,#017DFC)] bg-sky-500 px-16 py-2.5 text-base font-semibold leading-6 text-white shadow-sm max-md:px-5">
          Enroll
        </div>
      </div>
    </div>
  )
}

export default CourseCard

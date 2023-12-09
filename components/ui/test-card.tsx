import React from "react"
import Clock from "@/components/shared/icons/clock.svg"
import Star from "@/components/shared/icons/star.svg"


type Props = React.ComponentPropsWithoutRef<"div"> & {
  name: string
  time: string
  rating: number
  description: string
}

function TestCard({ name, time, rating, description }: Props) {
  return (
    <form className="flex flex-col items-stretch rounded-2xl border border-solid border-[color:var(--grey-300,#D0D5DD)] bg-white px-6 pb-12 pt-6 shadow-sm">
      <header className="text-xl font-bold leading-8 text-black">{name}</header>
      <div className="mt-3 flex items-stretch justify-between gap-0">
        <div className="flex items-stretch justify-between gap-1">
          <Clock />
          <div className="my-auto grow self-center whitespace-nowrap text-base text-gray-500">
            {time}
          </div>
        </div>
        <div className="flex items-stretch justify-between gap-1">
          <Star />
          <div className="my-auto grow self-center whitespace-nowrap text-base text-slate-700">
            {rating}
          </div>
        </div>
      </div>
      <div className="mb-2.5 mt-4 text-base leading-6 text-black">
        {description}
      </div>
    </form>
  )
}

export default TestCard

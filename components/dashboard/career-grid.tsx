import React from "react"
import CareerCard, { Career } from "@/components/shared/career-card"

type Props = React.ComponentPropsWithoutRef<"div"> & {
  careers?: Career[]
}

export default function CareerGrid({ careers }: Props) {
  console.log(careers)
  return (
    <>
      <p className="text-neutral-700 font-normal text-lg py-8">We found {careers.length} suitable careers for you! </p>
      <p className="text-neutral-700 font-normal text-lg pb-8">
        Open the details page to find more information about the career, way to
        test whether the career suits as well as trainings.
      </p>
      <div className="flex flex-row flex-wrap gap-4">
        {careers.map((c) => (
          <CareerCard key={c.uid} data={c} />
        ))}
      </div>
    </>
  )
}

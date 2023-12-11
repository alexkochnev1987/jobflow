import React from "react"
import CareerCard, { Career } from "@/components/shared/career-card"

type Props = React.ComponentPropsWithoutRef<"div"> & {
  careers?: Career[]
}

export default function CareerGrid({ careers }: Props) {
  return (
    <div className="flex flex-row flex-wrap gap-4">
      {careers.map((c) => (
        <CareerCard key={c.uid} data={c} />
      ))}
    </div>
  )
}

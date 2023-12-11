import React from "react"
import CareerCard from "@/components/shared/career-card"

type Props = React.ComponentPropsWithoutRef<"div"> & {
  careers?: any[]
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

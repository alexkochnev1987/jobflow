import React from "react"
import CareerCard, { Career } from "@/components/shared/career-card"
import Skeleton from "react-loading-skeleton"

import l18n from "@/i18n/config"

type Props = React.ComponentPropsWithoutRef<"div"> & {
  careers?: Career[]
  isLoading?: boolean
}

export default function CareerGrid({ careers, isLoading }: Props) {
  console.log(careers)
  return (
    <>
      <p className="py-8 text-md font-normal text-neutral-700">
        {isLoading && <Skeleton className="w-1/3" count={1} />}
        {!isLoading && (
          <>
            {l18n.t(
              "dashboard.greeting",
              "We found {{careers}} suitable careers for you!",
              {
                careers: careers?.length,
              },
            )}{" "}
          </>
        )}
      </p>
      <p className="pb-8 text-md font-normal text-neutral-700">
        {!isLoading && (
          <>
            {l18n.t(
              "dashboard.body",
              "Open the details page to find more information about the career, way to test whether the career suits as well as trainings.",
            )}
          </>
        )}
      </p>
      <div className="grid grid-cols-1 md:grid-cols-3 gap-5">
        {isLoading && <Skeleton count={1} height={300} width={300} />}
        {!isLoading && (
          <>
            {careers.map((c) => (
              <CareerCard key={c.id} data={c} />
            ))}
          </>
        )}
      </div>
    </>
  )
}

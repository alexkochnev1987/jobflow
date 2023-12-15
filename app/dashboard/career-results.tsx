"use client"
import { useResults } from "@/lib/hooks/use-results"

import Loading from "@/components/shared/loading"
import React from "react"
import CareerGrid from "@/components/dashboard/career-grid"
import Skeleton from "react-loading-skeleton"

export function CareerResults({ user, careers }) {
  const { isLoading, results } = useResults()

  console.log("results", results)
  console.log("careers", careers)

  // if (isLoading)
  //   return (
  //     <>
  //       <Skeleton className="w-2/3" height={30} count={1} />
  //       <Skeleton className="w-1/3" count={1} />

  //       <div>
  //         <Skeleton className="w-2/3" height={320} width={320} count={1} />
  //       </div>
  //     </>
  //   )

  return (
    <>
      {isLoading && <Skeleton className="w-1/3" height={30}  count={1} />}
      {!isLoading && (
        <h1 className="text-xl font-bold leading-8 text-neutral-700">
          Welcome {user.name}👋
        </h1>
      )}
      <CareerGrid careers={careers} isLoading={isLoading} />
    </>
  )
}

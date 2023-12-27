"use client"
import { useResults } from "@/lib/hooks/use-results"

import React from "react"
import CareerGrid from "@/components/dashboard/career-grid"
import Skeleton from "react-loading-skeleton"

export function CareerResults({ user, careers }) {
  const { isLoading, results } = useResults()

  console.log(
    "results",
    results?.careers?.map((c) => c.uid),
  )

  const merged = careers
    .map((c) => ({ ...c, ...results?.careers?.find((r) => r.uid === c.id) }))
    .sort((a, b) => b.rating - a.rating)
  console.log("careers merged", merged)
  return (
    <>
      {isLoading && <Skeleton className="w-1/3" height={30} count={1} />}
      {!isLoading && (
        <h1 className="text-xl font-bold leading-8 text-neutral-700">
          Welcome {user.name}👋
        </h1>
      )}
      <CareerGrid careers={merged} isLoading={isLoading} />
    </>
  )
}

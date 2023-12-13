"use client"
import { useResults } from "@/lib/hooks/use-results"

import Loading from "@/components/shared/loading"
import React from "react"
import CareerGrid from "@/components/dashboard/career-grid"

export function ProfileTabs({ user }) {
  const { isLoading, results } = useResults()

  if (isLoading) return <Loading />

  return (
    <>
      <h1 className="text-xl font-bold leading-8 text-neutral-700">
        Welcome {user.name}👋
      </h1>
      <CareerGrid careers={results?.careers} />
    </>
  )
}

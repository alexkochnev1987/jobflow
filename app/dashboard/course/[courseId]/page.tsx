"use server"
import CourseCarousel from "@/components/dashboard/course-carousel"
import TestsCarousel from "@/components/dashboard/test-carousel"
import BackIcon from "@/icons/back.svg"
import tests from "@/test/mocks/tests.json"

import Link from "next/link"
import { ROUTES } from "@/lib/constants"
import { getCareer } from "@/app/actions/server"
import { Career } from "@/components/shared/career-card"
import React from "react"
import Skeleton from "react-loading-skeleton"

export default async function Page({
  params,
}: {
  params: { careerId: string }
}) {
  const career: Career = await getCareer(params.careerId)

  console.log("career", career)

  return (
    <div>
      <Link href={ROUTES.DashBoard}>
        <h1 className="flex cursor-pointer flex-row items-center text-xl font-bold">
          <BackIcon /> Results
        </h1>
      </Link>
      <React.Suspense
        fallback={<Skeleton className="w-1/3" height={30} count={3} />}
      >
        <TestsCarousel tests={tests} />
        <CourseCarousel courses={[]} />
      </React.Suspense>
    </div>
  )
}

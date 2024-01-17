"use server"
import CourseCarousel from "@/components/dashboard/course-carousel"
import TestsCarousel from "@/components/dashboard/test-carousel"
import BackIcon from "@/icons/back.svg"

import Link from "next/link"
import JobListing from "./view-job"
import { ROUTES } from "@/lib/constants"
import { getCareer } from "@/app/actions/careers"
import { Career } from "@/components/shared/career-card"
import React from "react"
import Skeleton from "react-loading-skeleton"
import { Test } from "@/components/shared/test-card"
import { Course } from "@/components/shared/course-card"
import l18n from "@/i18n/config"
import { getCareerFormat, getCareerPace } from "@/lib/utils"

export default async function Page({
  params,
}: {
  params: { careerId: string }
}) {
  const career: Career = await getCareer(params.careerId)

  console.log("courses", career.Careers_Courses)

  const courses = career.Careers_Courses?.map((c) => c.courses).filter(
    (c) => c,
  ) as Course[]
  const quizzes = career.Careers_Quizzes?.map((c) => c.Quizzes).filter(
    (c) => c,
  ) as Test[]
  console.log("quizzes", quizzes)
  const pace = getCareerPace(career)
  const format = getCareerFormat(career)
  return (
    <div>
      <Link href={ROUTES.DashBoard}>
        <h1 className="flex cursor-pointer flex-row items-center text-xl font-bold">
          <BackIcon /> {l18n.t("dashboard.career.back", "Results")}
        </h1>
      </Link>
      <React.Suspense
        fallback={<Skeleton className="w-1/3" height={30} count={3} />}
      >
        <JobListing {...career} rating={90} pace={pace} format={format} />

        <TestsCarousel tests={quizzes} />
        <CourseCarousel courses={courses} />
      </React.Suspense>
    </div>
  )
}

"use server"
import CourseCarousel from "@/components/dashboard/course-carousel"
import TestsCarousel from "@/components/dashboard/test-carousel"
import BackIcon from "@/icons/back.svg"
import courses from "@/test/mocks/courses.json"
import tests from "@/test/mocks/tests.json"

import Link from "next/link"
import JobListing from "./view-job"
import { ROUTES } from "@/lib/constants"
import { getCareer } from "@/app/actions/server"
import { Career } from "@/components/shared/career-card"

export default async function Page({
  params,
}: {
  params: { careerId: string }
}) {
  const career: Career = await getCareer(params.careerId)

  return (
    <div>
      <Link href={ROUTES.DashBoard}>
        <h1 className="flex cursor-pointer flex-row items-center text-xl font-bold">
          <BackIcon /> Results
        </h1>
      </Link>
      <div>
        <JobListing {...career} rating={90} />
      </div>
      <TestsCarousel tests={tests} />
      <CourseCarousel courses={courses} />
    </div>
  )
}

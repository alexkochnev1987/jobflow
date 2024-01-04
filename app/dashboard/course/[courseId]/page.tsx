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
import { getCourseById } from "@/app/actions/courses"
import ViewCourse from "./view-course"
import GoBack from "@/components/shared/go-back"

export default async function Page({
  params,
}: {
  params: { courseId: number }
}) {
  const course = await getCourseById(params.courseId)

  console.log("course", course)

  return (
    <div>
      <GoBack title={course.name} />
      <ViewCourse {...course} />
    </div>
  )
}

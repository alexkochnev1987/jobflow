"use server"
import React from "react"
import { getCourseById } from "@/app/actions/courses"
import ViewCourse from "./view-course"
import GoBack from "@/components/shared/go-back"

export default async function Page({
  params,
}: {
  params: { courseId: number }
}) {
  const course = await getCourseById(params.courseId)

  const prototypes = course.Courses_Prototypes?.map((p) => p.Prototypes)

  console.log("course", course)
  console.log("prototypes", prototypes)

  return (
    <div>
      <GoBack title={course.name} />
      <ViewCourse {...course} prototypes={prototypes} />
    </div>
  )
}

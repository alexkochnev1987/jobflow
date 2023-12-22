"use server"
import React from "react"
import CourseForm from "../../form"
import { getCourseById } from "@/app/actions/courses"

export default async function Page({
  params,
}: {
  params: { courseId: number }
}) {
  const courseId = params.courseId
  console.log("courseId", courseId)
  const course = await getCourseById(courseId)
  return <CourseForm defaultValues={{ ...course }} />
}

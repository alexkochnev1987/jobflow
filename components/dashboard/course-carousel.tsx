import React from "react"
import CourseCard, { Course } from "../shared/course-card"

type Props = React.ComponentPropsWithoutRef<"div"> & {
  courses?: Course[]
}

export default function CourseCarousel({ courses }: Props) {
  console.log(courses)
  return (
    <>
      <div className="flex flex-row flex-wrap h-[600px] overflow-hidden">
        {courses.map((c) => (
          <CourseCard key={c.name} {...c} />
        ))}
      </div>
    </>
  )
}

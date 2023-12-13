import React from "react"
import CourseCard, { Course } from "../shared/course-card"

type Props = React.ComponentPropsWithoutRef<"div"> & {
  courses?: Course[]
}

export default function CourseCarousel({ courses }: Props) {
  console.log(courses)
  return (
    <>
     <h1 className="text-lg font-bold">Umschulungen</h1>
      <div className="flex flex-row flex-wrap overflow-hidden flex-grow">
        {courses.map((c) => (
          <CourseCard key={c.name} {...c} />
        ))}
      </div>
    </>
  )
}

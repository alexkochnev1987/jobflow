"use client"
import React from "react"
import CourseCard, { Course } from "../shared/course-card"
import Carousel from "react-multi-carousel"
import Arrow from "@/icons/arrow-next.svg"

type Props = React.ComponentPropsWithoutRef<"div"> & {
  courses?: Course[]
}

const responsive = {
  desktop: {
    breakpoint: { max: 3000, min: 1024 },
    items: 3,
  },
  tablet: {
    breakpoint: { max: 1024, min: 464 },
    items: 2,
  },
  mobile: {
    breakpoint: { max: 464, min: 0 },
    items: 1,
  },
}
const ButtonGroup = ({ next, previous }) => {
  return (
    <div className="carousel-button-group absolute -top-2 right-1 flex cursor-pointer flex-row gap-3">
      <Arrow onClick={() => previous()} className="rotate-180" />
      <Arrow onClick={() => next()} />
    </div>
  )
}
export default function CourseCarousel({ courses }: Props) {
  console.log(courses)

  if (!courses || courses.length < 1)
    return (
      <h1 className="my-3 text-lg font-bold">
        There are not Courses for this career
      </h1>
    )

  return (
    <>
      <h1 className="my-3 text-lg font-bold">Umschulungen</h1>
      <Carousel
        arrows={false}
        customButtonGroup={
          <ButtonGroup next={undefined} previous={undefined} />
        }
        responsive={responsive}
        swipeable={true}
        showDots={false}
        ssr={true} // means to render carousel on server-side.
        infinite={true}
        keyBoardControl={true}
        containerClass="flex flex-row relative"
        deviceType={"desktop"}
      >
        {courses.map((c) => (
          <CourseCard key={c?.name} {...c} />
        ))}
      </Carousel>
    </>
  )
}

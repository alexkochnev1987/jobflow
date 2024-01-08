"use client"
import React from "react"
import CourseCard, { Course } from "../shared/course-card"
import Carousel from "react-multi-carousel"
import Arrow from "@/icons/arrow-next.svg"
import l18n from "@/i18n/config"

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
    <div className="carousel-button-group absolute -top-8 right-1 flex cursor-pointer flex-row gap-3">
      <Arrow onClick={() => previous()} className="rotate-180" />
      <Arrow onClick={() => next()} />
    </div>
  )
}
export default function CourseCarousel({ courses }: Props) {
  console.log(courses)

  if (!courses || courses.length < 1) return <></>

  return (
    <>
      <p className="mb-5 mt-8  text-base font-semibold leading-normal text-slate-700">
        {l18n.t("course.carousel.title", "Umschulungen")}{" "}
        <span className="font-normal text-gray-400">({courses.length})</span>
      </p>
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
        containerClass="flex flex-row overflow-visible overflow-x-clip"
        deviceType={"desktop"}
      >
        {courses.map((c) => (
          <CourseCard key={c?.name} {...c}  />
        ))}
      </Carousel>
    </>
  )
}

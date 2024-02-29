"use client"
import React from "react"
import Carousel from "react-multi-carousel"
import Arrow from "@/icons/arrow-next.svg"
import TestCard, { Test } from "../shared/test-card"
import l18n from "@/i18n/config"

type Props = React.ComponentPropsWithoutRef<"div"> & {
  tests?: Test[]
}

const responsive = {
  desktop: {
    breakpoint: { max: 3000, min: 1024 },
    items: 3,
    arrows: true,
    swipeable: false
  },
  tablet: {
    breakpoint: { max: 1024, min: 464 },
    items: 2,
    arrows: false,
    swipeable: true
  },
  mobile: {
    breakpoint: { max: 464, min: 0 },
    items: 1,
    arrows: false,
    swipeable: true
  },
}

const ButtonGroup = ({ next, previous }) => {
  return (
    <div className="carousel-button-group absolute -top-8 right-1 z-50 flex cursor-pointer flex-row gap-3">
      <Arrow onClick={() => previous()} className="rotate-180" />
      <Arrow onClick={() => next()} />
    </div>
  )
}

export default function TestsCarousel({ tests }: Props) {

  if (!tests || tests.length < 1) {
    return <></>
  }

  return (
    <div className="relative">
      <p className="mb-5 mt-2 text-md font-semibold leading-normal">
        {l18n.t("test.carousel.title", "Beruf testen")}{" "}
        <span className="font-normal text-gray-400">({tests.length})</span>
      </p>
      <Carousel
        customButtonGroup={
          <ButtonGroup next={undefined} previous={undefined} />
        }
        responsive={responsive}
        showDots={false}
        ssr={true} // means to render carousel on server-side.
        infinite={true}
        keyBoardControl={true}
        containerClass="flex flex-row overflow-visible overflow-x-clip"
        deviceType={"desktop"}
      >
        {tests.map((c) => (
          <TestCard key={c.name} {...c} />
        ))}
      </Carousel>
    </div>
  )
}

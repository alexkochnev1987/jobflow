"use client"
import React from "react"
import Carousel from "react-multi-carousel"
import Arrow from "@/icons/arrow-next.svg"
import TestCard, { Test } from "../shared/test-card"

type Props = React.ComponentPropsWithoutRef<"div"> & {
  tests?: Test[]
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

export default function TestsCarousel({ tests }: Props) {
  console.log(tests)

  if (!tests) {
    return <h1 className="my-2 text-lg font-bold">No tests found</h1>
  }

  return (
    <>
      <h1 className="my-2 text-lg font-bold">Beruf testen</h1>
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
        containerClass="flex flex-row"
        deviceType={"desktop"}
      >
        {tests.map((c) => (
          <TestCard key={c.name} {...c} />
        ))}
      </Carousel>
    </>
  )
}

"use client"

import * as React from "react"
import * as SliderPrimitive from "@radix-ui/react-slider"

import { cn, sliderResponseToText } from "@/lib/utils"

const Circle = (props) => (
  <svg
    xmlns="http://www.w3.org/2000/svg"
    width="24"
    height="24"
    viewBox="0 0 24 24"
    fill="none"
    stroke="#5570F1"
    strokeWidth="3"
    strokeLinecap="round"
    strokeLinejoin="round"
    {...props}
  >
    <circle cx="12.1" cy="12.1" r="1" />
  </svg>
)

const Slider = React.forwardRef<
  React.ElementRef<typeof SliderPrimitive.Root>,
  React.ComponentPropsWithoutRef<typeof SliderPrimitive.Root>
>(({ className, ...props }, ref) => (
  <>
    <SliderPrimitive.Root
      ref={ref}
      className={cn(
        "relative flex w-full touch-none select-none items-center",
        className,
      )}
      {...props}
    >
      <SliderPrimitive.Track className="relative h-2 w-full grow overflow-hidden rounded-full bg-gray-100">
        <SliderPrimitive.Range className="absolute h-2 bg-gray-100" />
      </SliderPrimitive.Track>
      <SliderPrimitive.Thumb className="block h-5 w-5 rounded-full border-2 border-white bg-primary ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50" />
    </SliderPrimitive.Root>
    <ul className="flex w-full flex-row items-stretch text-base leading-4 text-[#5E6366]">
      <li className="text- left relative w-1/4">
        <Circle className="pointer-events-none absolute left-[-1px] top-[-36px] text-lg font-bold text-primary" />
        {sliderResponseToText("1")}
      </li>
      <li className=" relative w-1/4">
        <Circle className="pointer-events-none absolute left-1 top-[-36px]  text-lg font-bold text-primary" />
        {sliderResponseToText("2")}
      </li>
      <li className=" relative w-1/4">
        <Circle className="pointer-events-none absolute left-3 top-[-36px] text-lg font-bold text-primary" />
        {sliderResponseToText("3")}
      </li>
      <li className=" relative w-1/4">
        <Circle className="pointer-events-none absolute left-5 top-[-36px] text-lg font-bold text-primary" />
        {sliderResponseToText("4")}
      </li>
      <li className="relative text-center">
        <Circle className="pointer-events-none absolute left-7 top-[-36px] text-lg font-bold text-primary" />
        {sliderResponseToText("5")}
      </li>
    </ul>
  </>
))
Slider.displayName = SliderPrimitive.Root.displayName

export { Slider }

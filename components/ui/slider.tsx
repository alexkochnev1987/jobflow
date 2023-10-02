"use client"

import * as React from "react"
import * as SliderPrimitive from "@radix-ui/react-slider"

import { cn, sliderResponseToText } from "@/lib/utils"

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
      <SliderPrimitive.Thumb className="block h-5 w-5 rounded-full border-2 border-primary bg-background ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50" />
    </SliderPrimitive.Root>
    <ul className="flex w-full flex-row items-stretch text-base leading-4 text-[#5E6366]">
      <li className="text- left w-1/4">{sliderResponseToText("1")}</li>
      <li className=" w-1/4">{sliderResponseToText("2")}</li>
      <li className=" w-1/4">{sliderResponseToText("3")}</li>
      <li className=" w-1/4">{sliderResponseToText("4")}</li>
      <li className="">{sliderResponseToText("5")}</li>
    </ul>
  </>
))
Slider.displayName = SliderPrimitive.Root.displayName

export { Slider }

"use client"

import * as React from "react"
import * as ProgressPrimitive from "@radix-ui/react-progress"

import { cn } from "@/lib/utils"

const Progress = React.forwardRef<
  React.ElementRef<typeof ProgressPrimitive.Root>,
  React.ComponentPropsWithoutRef<typeof ProgressPrimitive.Root>
>(({ className, value, ...props }, ref) => (
  <ProgressPrimitive.Root
    ref={ref}
    className={cn(
      "relative mx-auto h-2 max-w-7xl overflow-hidden bg-white",
      className,
    )}
    {...props}
  >
    <ProgressPrimitive.Indicator
      className="absolute top-1 h-2 w-full flex-1 rounded-md border-none bg-gray-100 transition-all"
      style={{ transform: `translateX(-0%)` }}
    />
    <ProgressPrimitive.Indicator
      className="h-full w-full flex-1 rounded-md border-none bg-primary transition-all"
      style={{ transform: `translateX(-${100 - (value || 0)}%)` }}
    />
  </ProgressPrimitive.Root>
))
Progress.displayName = ProgressPrimitive.Root.displayName

export { Progress }

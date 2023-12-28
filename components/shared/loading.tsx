"use client"

import { Loader2 } from "lucide-react"
import Skeleton from "react-loading-skeleton"

export default function Loading() {
  return (
    <>
      <Skeleton className="w-full" width={350} height={20} count={1} />
      <Skeleton className="w-full" width={350} height={350} count={1} />
    </>
  )
}

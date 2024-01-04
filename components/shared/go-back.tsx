"use client"
import BackIcon from "@/icons/back.svg"
import { useRouter } from "next/navigation"
import React from "react"

export default function GoBack({ title }) {
  const router = useRouter()
  return (
    <h1
      className="flex cursor-pointer flex-row items-center text-xl font-bold"
      onClick={() => router.back()}
    >
      <BackIcon /> {title}
    </h1>
  )
}

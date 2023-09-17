"use client"
import Question from "@/components/shared/question"

export default async function Home() {
  return (
    <>
      <div className="z-10 w-full max-w-6xl px-5 xl:px-0">
        <Question />
      </div>
    </>
  )
}

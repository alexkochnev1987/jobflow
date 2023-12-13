import React from "react"
import TestCard, { Test } from "../shared/test-card"

type Props = React.ComponentPropsWithoutRef<"div"> & {
  tests?: Test[]
}

export default function TestsCarousel({ tests }: Props) {
  console.log(tests)
  return (
    <>
      <h1 className="text-lg font-bold">Beruf testen</h1>
      <div className="min-h-52 my-3 flex flex-grow flex-row flex-wrap overflow-hidden">
        {tests.map((c) => (
          <TestCard key={c.name} {...c} />
        ))}
      </div>
    </>
  )
}

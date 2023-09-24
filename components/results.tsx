"use client"
import { useResults } from "@/lib/hooks/use-results"
import { Flex, Heading } from "@radix-ui/themes"

import Timeout from "@/components/shared/timeout"
import MatchingCareerCard from "@/components/shared/matching-career"
import Loading from "@/components/shared/loading"
export default function Results() {
  const { isLoading, results } = useResults()
  const youArWork = results?.youAtWork || []
  const strengths = results?.strengths || []
  const careers = results?.careers || []

  const seconds = 15 * 60
  return (
    <>
      {isLoading && (
        <div className="z-10 flex flex-col items-center">
          <Heading size="5" className="w-full p-5">
            Dein Ergebnis wird berechnet
          </Heading>
          <Loading />
        </div>
      )}
      {!isLoading && (
        <>
          <div className="z-10 w-full max-w-5xl px-5 xl:px-0">
            <Flex direction="column" gap="5" align="start">
              <Timeout defaultSeconds={seconds} />
              <p>
                Your answers were analyzed by an A.I. analyzed. The assessment
                we just completed is required by companies, universities and
                career coaches around the world.
              </p>
              <Heading size="7">You at Work</Heading>
              {youArWork.map((t) => (
                <p key={t}>{t}</p>
              ))}
              <Heading size="7">Strengths</Heading>
              {strengths.map((t) => (
                <p key={t}>{t}</p>
              ))}
              <Heading size="8">Matching Careers</Heading>
              <div className="relative w-full">
                <div className="absolute z-10 h-full w-full rounded bg-gradient-to-b from-transparent via-white to-gray-50 opacity-70"></div>
                <div className="relative">
                  {careers.map((c, index) => (
                    <MatchingCareerCard key={c.uid} id={index + 1} career={c} />
                  ))}
                </div>
              </div>
            </Flex>
          </div>
        </>
      )}
    </>
  )
}

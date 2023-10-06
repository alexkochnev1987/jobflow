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
          <Heading
            size="5"
            className="w-full p-5 text-2xl font-normal leading-7"
          >
            Dein Ergebnis wird berechnet
          </Heading>
          <Loading />
        </div>
      )}
      {!isLoading && (
        <>
          <div className="z-10 w-full max-w-3xl p-5">
            <Flex direction="column" gap="5" align="start">
              <Timeout defaultSeconds={seconds} />
              <p>
                Ihre Antworten wurden von einer K.I. analysiert. Das soeben
                abgeschlossene Assessment wird von Unternehmen, Universitäten
                und Karrierecoaches auf der ganzen Welt verlangt.
              </p>
              <Heading size="7" className="font-normal leading-7">
                Sie bei der Arbeit
              </Heading>
              {youArWork.map((t) => (
                <p key={t}>{t}</p>
              ))}
              <Heading size="7" className="font-normal leading-7">
                Stärken
              </Heading>
              {strengths.map((t) => (
                <p key={t}>{t}</p>
              ))}
              <Heading size="8" className="font-normal leading-7">
                Passende Karrieren
              </Heading>
              <div className="relative w-full">
                <div className="absolute z-10 h-full w-full rounded bg-gradient-to-b from-transparent via-white to-gray-50 opacity-70"></div>
                <div className="relative">
                  {careers.map((c, index) => (
                    <MatchingCareerCard
                      key={c.uid}
                      id={index + 1}
                      career={c}
                      hidden={true}
                    />
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

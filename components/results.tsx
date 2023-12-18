"use client"
import { useResults } from "@/lib/hooks/use-results"
import { Flex, Heading } from "@radix-ui/themes"

import Timeout from "@/components/shared/timeout"
import MatchingCareerCard from "@/components/shared/matching-career"
import Loading from "@/components/shared/loading"
import { useTranslation } from "react-i18next"
export default function Results() {
  const { isLoading, results } = useResults()
  const { t } = useTranslation()

  console.log("results", results)
  const youArWork = results?.personality?.you_at_work || ""
  const strengths = results?.personality?.strengths_summary || ""
  const communicationSkills = results?.personality?.communications_skills || ""
  const leadership = results?.personality?.leadership || ""
  const teamwork = results?.personality?.teamwork || ""
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
              <p>{youArWork}</p>
              <Heading size="7" className="font-normal leading-7">
                Stärken
              </Heading>
              <p>{strengths}</p>
              <Heading size="7" className="font-normal leading-7">
                {t("Kommunikationsfähigkeiten")}
              </Heading>
              <p>{communicationSkills}</p>
              <Heading size="7" className="font-normal leading-7">
                {t("Führungsqualitäten")}
              </Heading>
              <p>{leadership}</p>
              <Heading size="7" className="font-normal leading-7">
                {t("Arbeit im Team")}
              </Heading>
              <p>{teamwork}</p>
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
                      {...c}
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

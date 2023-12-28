"use client"
import { useResults } from "@/lib/hooks/use-results"
import { Flex, Heading } from "@radix-ui/themes"

import Timeout from "@/components/shared/timeout"
import MatchingCareerCard from "@/components/shared/matching-career"
import Loading from "@/components/shared/loading"
import { useTranslation } from "react-i18next"
import PaymentButton from "./payment/button"
import CheckCircle from "@/icons/checkbox.svg"
import Image from "next/image"
export default function Results() {
  const { isLoading, results } = useResults()
  const { t } = useTranslation()

  console.log("results", results)
  const youArWork = results?.personality?.you_at_work || ""
  const strengths = results?.personality?.strengths_summary || ""
  const communicationSkills = results?.personality?.communications_skills || ""
  const leadership = results?.personality?.leadership || ""
  const teamwork = results?.personality?.teamwork || ""

  // only show the first 3 careers
  const careers = results?.careers || []
  careers.splice(3, careers.length - 3)

  const seconds = 15 * 60
  return (
    <>
      {isLoading && (
        <div className="z-10 flex flex-col items-center">
          <Heading
            size="5"
            className="w-full p-5 text-center text-2xl font-normal leading-7"
          >
            Dein Ergebnis wird berechnet
          </Heading>
          <Loading />
        </div>
      )}
      {!isLoading && (
        <>
          <div className="z-10 w-full max-w-3xl p-5">
            <h1 className="mb-2 text-center text-lg font-bold leading-8 text-neutral-700">
              Here are your results 🎉
            </h1>
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
              <div className="relative  w-full">
                <div className="absolute z-10 h-full w-full rounded bg-gradient-to-b from-transparent via-white to-gray-50 opacity-70"></div>
                <div className="relative">
                  {careers.map((c, index) => (
                    <MatchingCareerCard
                      key={c.uid}
                      {...c.data}
                      {...c}
                      id={index + 1}
                      hidden={true}
                    />
                  ))}
                </div>
              </div>
              <div className=" z-20 flex w-full flex-col align-middle">
                <div className="m-auto">
                  <PaymentButton className="text-bold !hover:bg-rose-600 m-auto max-w-sm rounded-full !bg-rose-500 text-lg leading-snug text-white" />
                </div>
                <ul className="m-auto text-lg font-bold leading-7 text-neutral-700">
                  <li className="flex flex-row items-center gap-1">
                    <CheckCircle className="h-9 w-9" />
                    60-Tage-Zufriedenheitsgarantie
                  </li>
                  <li className="flex flex-row items-center gap-1">
                    <CheckCircle className="h-9 w-9" /> 100% sicher{" "}
                    <Image
                      src={"/ssl.png"}
                      width="53"
                      height="23"
                      alt="SSL"
                      className="ml-2"
                    />
                  </li>
                  <li className="flex flex-row items-center gap-1">
                    <CheckCircle className="h-9 w-9" /> Sofortiger Zugang und
                    lebenslanger Kundensupport
                  </li>
                </ul>
              </div>
            </Flex>
          </div>
        </>
      )}
    </>
  )
}

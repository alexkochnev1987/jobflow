"use client"
import { useResults } from "@/lib/hooks/use-results"
import { Flex, Heading } from "@radix-ui/themes"

import Timeout from "@/components/shared/timeout"
import MatchingCareerCard from "@/components/shared/matching-career"
import Loading from "@/components/shared/loading"
import l18n from "@/i18n/config"
import PaymentButton from "@/components/payment/button"
import CheckCircle from "@/icons/checkbox.svg"
import Image from "next/image"
import LoadingAnimation from "./loading-animation"
export default function Results() {
  const { isLoading, results } = useResults()
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
            className="w-full p-5 text-center font-heading text-2xl leading-7"
          >
            {l18n.t("results.title", "Dein Ergebnis wird berechnet")}
          </Heading>
          <LoadingAnimation />
        </div>
      )}
      {!isLoading && (
        <>
          <div className="z-10 w-full max-w-3xl p-5">
            <h1 className="mb-2 text-center text-lg font-bold leading-8 text-neutral-700">
              {l18n.t("results.subtitle", "Here are your results 🎉")}
            </h1>
            <Flex direction="column" gap="5" align="start">
              <Timeout defaultSeconds={seconds} />
              <p>
                {l18n.t(
                  "results.ai",
                  "Ihre Antworten wurden von einer K.I. analysiert. Das soeben abgeschlossene Assessment wird von Unternehmen, Universitäten und Karrierecoaches auf der ganzen Welt verlangt.",
                )}
              </p>
              <Heading size="7" className="font-heading leading-7">
                {l18n.t("results.you-at-work", "Sie bei der Arbeit")}
              </Heading>
              <p>{youArWork}</p>
              <Heading size="7" className="font-heading leading-7">
                {l18n.t("results.strenghts", "Stärken")}
              </Heading>
              <p>{strengths}</p>
              <Heading size="7" className="font-heading leading-7">
                {l18n.t("results.communication", "Kommunikationsfähigkeiten")}
              </Heading>
              <p>{communicationSkills}</p>
              <Heading size="7" className="font-heading leading-7">
                {l18n.t("results.softskills", "Führungsqualitäten")}
              </Heading>
              <p>{leadership}</p>
              <Heading size="7" className="font-heading leading-7">
                {l18n.t("results.teamwork", "Arbeit im Team")}
              </Heading>
              <p>{teamwork}</p>
              <Heading size="8" className="font-heading leading-7">
                {l18n.t("results.careers", "Passende Karrieren")}
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
                  <PaymentButton />
                </div>
                <ul className="m-auto text-lg font-bold leading-7 text-neutral-700">
                  <li className="flex flex-row items-center gap-1">
                    <CheckCircle className="h-9 w-9" />
                    {l18n.t(
                      "results.payment-text-1",
                      "60-Tage-Zufriedenheitsgarantie",
                    )}
                  </li>
                  <li className="flex flex-row items-center gap-1">
                    <CheckCircle className="h-9 w-9" />{" "}
                    {l18n.t("results.payment-text-ssl", "100% sicher")}{" "}
                    <Image
                      src={"/ssl.png"}
                      width="53"
                      height="23"
                      alt="SSL"
                      className="ml-2"
                    />
                  </li>
                  <li className="flex flex-row items-center gap-1">
                    <CheckCircle className="h-9 w-9" />{" "}
                    {l18n.t(
                      "results.payment-text-3",
                      "Sofortiger Zugang und lebenslanger Kundensupport",
                    )}
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

"use client"
import { useResults } from "@/lib/hooks/use-results"
import { Flex, Heading } from "@radix-ui/themes"

import Timeout from "@/components/shared/timeout"
import MatchingCareerCard from "@/components/shared/matching-career"
import Loading from "@/components/shared/loading"
import { userStore } from "@/app/client/store"
export default function Results({ careers }) {
  const { isLoading, results } = useResults()
  console.log(results)
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
              <p>
                In your professional life, you thrive when your work aligns with
                your deeply held beliefs and values.
              </p>
              <p>
                You shine in roles that allow for creative expression and
                independence, where you can contribute your unique perspective.
              </p>
              <p>
                As a colleague, your approachability and supportiveness make you
                an essential team member, often providing emotional stability.
              </p>
              <p>
                You may find routine tasks less engaging, but when you can
                infuse your creativity and passion into your work, you become a
                catalyst for positive change in your workplace.
              </p>
              <Heading size="7">Strengths</Heading>
              <p>
                You excel at fostering positive working relationships due to
                your innate empathy and understanding of others.
              </p>
              <p>
                Your creativity shines through in problem-solving, offering
                innovative perspectives that can lead to breakthroughs.
              </p>
              <p>
                Dedication and passion drive you to give your best to projects
                aligned with your values, making you a source of inspiration for
                your team.
              </p>
              <p>
                Your adaptability and open-mindedness enable you to thrive in
                diverse work environments, embracing change as an opportunity
                for growth.
              </p>
              <Heading size="8">Matching Careers</Heading>
              <MatchingCareerCard id="1" />
              <div className="relative w-full">
                <div className="absolute z-10 h-full w-full rounded bg-gradient-to-b from-transparent via-white to-gray-50 opacity-90"></div>
                <div className="relative">
                  <MatchingCareerCard id="2" />
                  <MatchingCareerCard id="3" />
                </div>
              </div>
            </Flex>
          </div>
        </>
      )}
    </>
  )
}

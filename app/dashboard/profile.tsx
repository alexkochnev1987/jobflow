"use client"
import { Avatar, Badge, Box, Button, Card, Tabs, Text } from "@radix-ui/themes"
import { useResults } from "@/lib/hooks/use-results"
import { Flex, Heading } from "@radix-ui/themes"

import MatchingCareerCard from "@/components/shared/matching-career"
import Loading from "@/components/shared/loading"
import React from "react"
import CareerCard from "@/components/shared/career-card"
export function ProfileResults({ results }) {
  const careers = results?.careers || []
  const suitable = careers.filter((c) => c.rating >= 50)

  return (
    <>
      {careers.map((c, index) => (
        <MatchingCareerCard
          key={c.uid}
          id={index + 1}
          career={c}
          hidden={false}
        />
      ))}
    </>
  )
}

export function ProfileTabs() {
  const { isLoading, results } = useResults()

  if (isLoading) return <Loading />

  const werte = [
    "Hilfsbereitschaft",
    "Kreativität",
    "Mut",
    "Pünktlichkeit",
    "Präzision",
    "Effizienz",
  ]
  const starken = [
    "Geduld",
    "Organisationsfähigkeiten",
    "Kreativität",
    "Planungsfähigkeiten",
  ]

  const idealeArbeitsrahmen = [
    "Büroarbeit",
    "Unabhängig arbeiten",
    "Abwechslungsreiche Tätigkeit",
  ]
  return (
    <>
      <React.Suspense fallback={<Loading />}>
        <div className="text-left">
          <Heading size="6" className="mb-3 font-medium">
            Career lab
          </Heading>
          <Heading size="5" className="mb-5">
            Here are your results 🎉
          </Heading>
          <CareerCard />
          <CareerCard isLoading={true} />
          <Tabs.Root defaultValue="all" className="mx-auto w-full">
            <Tabs.List>
              <Tabs.Trigger value="all">All matches</Tabs.Trigger>
              <Tabs.Trigger value="saved">Saved</Tabs.Trigger>
            </Tabs.List>

            <Box px="4" pt="3" pb="2">
              <Tabs.Content value="all">
                <ProfileResults results={results} />
              </Tabs.Content>

              <Tabs.Content value="saved">
                <Flex
                  direction="row"
                  className="mx-auto my-5 w-full"
                  align="stretch"
                >
                  <Flex
                    align="center"
                    gap="2"
                    direction="column"
                    className="mx-10 w-1/5 text-center"
                  >
                    <Avatar
                      size="7"
                      src="https://images.unsplash.com/photo-1502823403499-6ccfcf4fb453?&w=64&h=64&dpr=2&q=70&crop=focalpoint&fp-x=0.5&fp-y=0.3&fp-z=1&fit=crop"
                      fallback="S"
                      radius="full"
                    />
                    <Heading size="5" className="">
                      John Doe
                    </Heading>
                    <p>Hamburg, Germany</p>
                    <Badge color="gray" radius="large" size="1" variant="solid">
                      Hilfsbereitschaft
                    </Badge>
                  </Flex>
                  <Flex className="mx-2 w-3/5" direction="column" gap="2">
                    <Card variant="surface" className="w-full p-3">
                      <Flex gap="3" align="start" direction="column">
                        <Text as="div" size="2" weight="bold">
                          Werte
                        </Text>
                        <Flex direction="row" gap="1">
                          {werte.map((w) => (
                            <Badge
                              color="gray"
                              radius="medium"
                              size="1"
                              variant="solid"
                              key={w}
                            >
                              {w}
                            </Badge>
                          ))}
                        </Flex>
                      </Flex>
                    </Card>
                    <Card variant="surface" className="w-full p-3">
                      <Flex gap="3" align="start" direction="column">
                        <Text as="div" size="2" weight="bold">
                          Stärken
                        </Text>
                        <Flex direction="row" gap="1">
                          {starken.map((w) => (
                            <Badge
                              color="gray"
                              radius="medium"
                              size="1"
                              variant="solid"
                              key={w}
                            >
                              {w}
                            </Badge>
                          ))}
                        </Flex>
                      </Flex>
                    </Card>
                    <Card variant="surface" className="w-full p-3">
                      <Flex gap="3" align="start" direction="column">
                        <Text as="div" size="2" weight="bold">
                          Ideale Arbeitsrahmen
                        </Text>
                        <Flex direction="row" gap="1">
                          {idealeArbeitsrahmen.map((w) => (
                            <Badge
                              color="gray"
                              radius="medium"
                              size="1"
                              variant="solid"
                              key={w}
                            >
                              {w}
                            </Badge>
                          ))}
                        </Flex>
                      </Flex>
                    </Card>
                    <Card variant="surface" className="w-full p-3">
                      <Flex gap="3" align="start" direction="column">
                        <Text as="div" size="2" weight="bold">
                          Persönlichkeitstyp
                        </Text>
                        <Flex direction="row" gap="1">
                          <Badge
                            color="gray"
                            radius="medium"
                            size="1"
                            variant="solid"
                          >
                            INFP
                          </Badge>
                        </Flex>
                      </Flex>
                    </Card>
                  </Flex>
                  <Flex className="w-1/5">
                    <Button
                      size="2"
                      variant="solid"
                      radius="full"
                      className="w-full p-5"
                    >
                      Edit profile
                    </Button>
                  </Flex>
                </Flex>
              </Tabs.Content>
            </Box>
          </Tabs.Root>
        </div>
      </React.Suspense>
    </>
  )
}

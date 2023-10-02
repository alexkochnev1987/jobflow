"use client"
import { Avatar, Badge, Box, Button, Card, Tabs, Text } from "@radix-ui/themes"
import { useResults } from "@/lib/hooks/use-results"
import { Flex, Heading } from "@radix-ui/themes"

import MatchingCareerCard from "@/components/shared/matching-career"
import Loading from "@/components/shared/loading"
export function ProfileResults({ results }) {
  const careers = results?.careers || []

  return (
    <>
      <div className="z-10 w-full max-w-5xl px-5 xl:px-0">
        <Flex direction="column" gap="5" align="start">
          <div className="relative w-full">
            <div className="relative">
              {careers.map((c, index) => (
                <MatchingCareerCard
                  key={c.uid}
                  id={index + 1}
                  career={c}
                  hidden={false}
                />
              ))}
            </div>
          </div>
          <Button size="3" variant="outline" className="w-56 self-end">
            cta
          </Button>
        </Flex>
      </div>
    </>
  )
}

export function ProfileTabs() {
  const { isLoading, results } = useResults()

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
        <Tabs.Root defaultValue="Empfehlungen" className="mx-auto w-2/3">
          <Tabs.List>
            <Tabs.Trigger value="Empfehlungen">Empfehlungen</Tabs.Trigger>
            <Tabs.Trigger value="Profil">Profil</Tabs.Trigger>
          </Tabs.List>

          <Box px="4" pt="3" pb="2">
            <Tabs.Content value="Empfehlungen">
              <ProfileResults results={results} />
            </Tabs.Content>

            <Tabs.Content value="Profil">
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
      )}
    </>
  )
}

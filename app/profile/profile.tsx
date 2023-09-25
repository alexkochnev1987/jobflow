"use client"
import { Box, Button, Tabs, Text } from "@radix-ui/themes"
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
        <Tabs.Root defaultValue="Empfehlungen">
          <Tabs.List>
            <Tabs.Trigger value="Empfehlungen">Empfehlungen</Tabs.Trigger>
            <Tabs.Trigger value="Profil">Profil</Tabs.Trigger>
            <Tabs.Trigger value="settings">Profil</Tabs.Trigger>
          </Tabs.List>

          <Box px="4" pt="3" pb="2">
            <Tabs.Content value="Empfehlungen">
              <ProfileResults results={results} />
            </Tabs.Content>

            <Tabs.Content value="Profil">
              <Text size="2">Access and update your documents.</Text>
            </Tabs.Content>

            <Tabs.Content value="settings">
              <Text size="2">
                Edit your profile or update contact information.
              </Text>
            </Tabs.Content>
          </Box>
        </Tabs.Root>
      )}
    </>
  )
}

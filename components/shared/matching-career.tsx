"use client"
import {
  Badge,
  Box,
  Button,
  Callout,
  Card,
  DropdownMenu,
  Flex,
  Heading,
  Text,
} from "@radix-ui/themes"
import { ChevronDown, Info } from "lucide-react"
import Skeleton from "react-loading-skeleton"

export default function MatchingCareerCard({ id }) {
  return (
    <Card
      variant="surface"
      style={{
        minWidth: "100%",
        minHeight: 300,
      }}
    >
      <Flex direction="row" justify="center" align="start">
        <Heading size="7" className="w-1/6 pt-2 text-center">
          {id}
        </Heading>
        <Flex direction="column" className="w-5/6 px-2" gap="2">
          <Flex direction="row">
            <div className="h-8 w-2/3 pr-5">
              <Skeleton width="100%" height="100%" borderRadius={20} />
            </div>
            <div>
              <Badge color="green" radius="full">
                90% <Info className="w-4" />
              </Badge>
            </div>
          </Flex>
          <Flex direction="row" justify="between" align="center">
            <p>
              Gehalt: <strong>37.000 - 65000 &euro;</strong>
            </p>
            <Badge color="gray" radius="full" size="2">
              Beruf mit Zukunft <Info className="w-4" />
            </Badge>
          </Flex>
          <Flex direction="row" justify="between" align="center">
            <p>
              Umschuling: <strong>12 Wochen</strong>
            </p>
            <Badge color="blue" radius="full" size="2">
              100% Forderbar <Info className="w-4" />
            </Badge>
          </Flex>
          <div>
            <Skeleton width="100%" borderRadius={20} count={4} />
          </div>
          <Flex direction="row">
            <Flex direction="row" className="w-5/6" gap="5">
              <div>
                <DropdownMenu.Root>
                  <DropdownMenu.Trigger>
                    <Button variant="ghost" color="gray">
                      Details
                      <ChevronDown />
                    </Button>
                  </DropdownMenu.Trigger>
                </DropdownMenu.Root>
              </div>
              <div>
                <DropdownMenu.Root>
                  <DropdownMenu.Trigger>
                    <Button variant="ghost" color="gray">
                      Anbieter
                      <ChevronDown />
                    </Button>
                  </DropdownMenu.Trigger>
                </DropdownMenu.Root>
              </div>
            </Flex>
            <Flex direction="row" className="w-1/6" justify="end">
              <Button variant="ghost" color="gray">
                Beruf testen
              </Button>
            </Flex>
          </Flex>
        </Flex>
      </Flex>
    </Card>
  )
}

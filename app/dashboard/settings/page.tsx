"use server"
import BackIcon from "@/icons/back.svg"

import Link from "next/link"
import { ROUTES } from "@/lib/constants"
import React from "react"
import l18n from "@/i18n/config"
import SettingsClient from "./settings-client"
import { deleteUser, updatePassword } from "@/app/actions/user"
import {
  Box,
  Card,
  Flex,
  ListItem,
  Switch,
  Text,
  UnorderedList,
} from "@chakra-ui/react"

export default async function Page() {
  const menu = [
    {
      title: "Konto",
      link: ROUTES.Settings,
    },
    {
      title: "Medien",
      link: ROUTES.Settings,
    },
    {
      title: "Benachrichtigungen",
      link: ROUTES.Settings,
    },
    {
      title: "Zahlungen & Rechnungen",
      link: ROUTES.Settings,
    },
    {
      title: "Daten & Sicherheit",
      link: ROUTES.Settings,
    },
  ]
  return (
    <Flex gap={5}>
      <Box flex="1">
        <Card p={5}>
          <Flex direction="column" gap={3}>
            {menu.map((item, index) => (
              <Link href={ROUTES.Settings} key={item.title}>
                <Text
                  fontSize={16}
                  fontWeight={400}
                  rounded="md"
                  p={1}
                  _hover={{
                    bg: "#F3F6FC",
                    fontWeight: 600,
                  }}
                >
                  {item.title}
                </Text>
              </Link>
            ))}
          </Flex>
        </Card>
      </Box>
      <Flex direction="column" gap={3} flex="3">
        <Text fontSize={20} fontWeight={700}>
          Benachrichtigungen
        </Text>
        <Card p={5}>
          {/* <SettingsClient
            deleteUser={deleteUser}
            updatePassword={updatePassword}
          /> */}
          <Flex direction="column" gap={5}>
            <Flex justify="space-between">
              <Box>
                <Text fontSize={14} fontWeight={600}>
                  Lead updates
                </Text>
                <Text fontSize={12} fontWeight={400}>
                  You are notified via e-mail once a user submits a request via
                  form
                </Text>
              </Box>
              <Box>
                <Switch id="email-alerts" />
              </Box>
            </Flex>
            <Flex justify="space-between">
              <Box>
                <Text fontSize={14} fontWeight={600}>
                  View updates
                </Text>
                <Text fontSize={12} fontWeight={400}>
                  You are notified via e-mail once a user opens your training
                  details page
                </Text>
              </Box>
              <Box>
                <Switch id="email-alerts" />
              </Box>
            </Flex>
            <Flex justify="space-between">
              <Box>
                <Text fontSize={14} fontWeight={600}>
                  Billing updates
                </Text>
                <Text fontSize={12} fontWeight={400}>
                  You are notified via e-mail once an invoice is sent
                </Text>
              </Box>
              <Box>
                <Switch id="email-alerts" />
              </Box>
            </Flex>
          </Flex>
        </Card>
      </Flex>
    </Flex>
  )
}

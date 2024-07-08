import {
  Body,
  Button,
  Container,
  Head,
  Hr,
  Html,
  Link,
  Preview,
  Section,
  Text,
} from "jsx-email"
import * as React from "react"
import Disclaimer from "./disclaimer"
import { anchor, box, container, heading, main, paragraph } from "./styles"
import { ROUTES } from "../lib/constants"

export const TemplateName = "account-deletion-email"

export const Template = () => (
  <Html>
    <Head />
    <Preview>🎉</Preview>
    <Body style={main}>
      <Container style={container}>
        <Section style={box}>
          <Text style={heading}>Account erfolgreich gelöscht!</Text>
          <Text style={paragraph}>
            Schade zu sehen, dass du dich entschieden hast, deinen Account zu
            löschen. 😢 Alles klar, dein Wunsch ist mir Befehl!
          </Text>
          <Text style={paragraph}>
            Es wurde alles, wirklich alles, gelöscht - all deine Daten und
            Testergebnisse sind jetzt in der digitalen Versenkung verschwunden.
            Falls du in der Zukunft wieder vorbeischauen möchtest, musst du
            leider von vorne anfangen. Ein neues Konto, ein neuer Test.:
          </Text>
          <Text style={paragraph}>
            Bei Feedback oder Fragen wende{" "}
            <Link href={`https://app.quereinstieg.com${ROUTES.Contact}`} style={anchor}>
              dich gerne an unseren Support.
            </Link>
          </Text>
          <Text style={paragraph}>Beste Grüße,</Text>
          <Text style={paragraph}>Dein Marcel 🌟</Text>

          <Disclaimer />
        </Section>
      </Container>
    </Body>
  </Html>
)

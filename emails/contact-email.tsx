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
} from "@react-email/components"
// Note: Superstruct is a fantastic validation package. It's smaller and faster than alternatives
// and uses a delightful API without chaining. docs.superstructjs.org
//
// To install `superstruct` run `pnpm add superstruct`.
import { defaulted, number, object, string, type Infer } from "superstruct"
import * as React from "react"
import Disclaimer from "./disclaimer"
import { anchor, box, container, heading, main, paragraph } from "./styles"
import { ROUTES } from "../lib/constants"

export const TemplateName = "contact-email"

export const TemplateStruct = object({
  name: defaulted(string(), "batman@example.com"),
  email: defaulted(string(), "batman@example.com"),
  message: defaulted(string(), "password"),
})

export type TemplateProps = Infer<typeof TemplateStruct>

export const Template = ({ name, email, message }: TemplateProps) => (
  <Html>
    <Head />
    <Preview>🎉</Preview>
    <Body style={main}>
      <Container style={container}>
        <Section style={box}>
          <Text style={heading}>🎉</Text>
          <Text style={heading}>
            Herzlichen Glückwunsch! Dein Testergebnis ist jetzt verfügbar!
          </Text>
          <Text style={paragraph}>
            Vielen Dank für dein Vertrauen in den Berufstest. Deine Ergebnisse
            stehen jetzt für Dich bereit.
          </Text>
          <Text style={paragraph}>Anmeldeinformationen:</Text>
          <Text style={paragraph}>
            <strong>Full Name:</strong> {name}
          </Text>
          <Text style={paragraph}>
            <strong>Email:</strong> {email}
          </Text>
          <Text style={paragraph}>
            <strong>Message:</strong> {message}
          </Text>

          <Text style={paragraph}>
            Um deine Ergebnisse einzusehen, melde Dich bitte unter folgendem
            Link an:{" "}
            <Link href={ROUTES.Login} style={anchor}>
              app.quereinstieg.com/login
            </Link>{" "}
            Nutzen Sie dazu die oben genannten Anmeldeinformationen.:
          </Text>
          <Text style={paragraph}>
            Bei Fragen oder Problemen{" "}
            <Link href={ROUTES.Login} style={anchor}>
              kontaktiere bitte den Support
            </Link>
            .
          </Text>
          <Disclaimer />
        </Section>
      </Container>
    </Body>
  </Html>
)

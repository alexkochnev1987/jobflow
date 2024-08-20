import {
  Body,
  Container,
  Head,
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
import { defaulted, object, string, type Infer } from "superstruct"
import * as React from "react"
import Disclaimer from "./disclaimer"
import { anchor, box, container, heading, main, paragraph } from "./styles"
import { ROUTES } from "../lib/constants"

export const TemplateName = "recover-email"

export const TemplateStruct = object({
  token: defaulted(string(), "sdsdsdd"),
})

export type TemplateProps = Infer<typeof TemplateStruct>

export const Template = ({ token }: TemplateProps) => (
  <Html>
    <Head />
    <Preview>Reset password request</Preview>
    <Body style={main}>
      <Container style={container}>
        <Section style={box}>
          <Text style={heading}>Reset password request</Text>

          <Text style={paragraph}>
            <Link
              href={`https://app.quereinstieg.com${ROUTES.ResetPassword(
                token,
              )}`}
              style={anchor}
            >
              {`https://app.quereinstieg.com${ROUTES.ResetPassword(token)}`}
            </Link>{" "}
          </Text>
          <Text style={paragraph}>
            Bei Fragen oder Problemen{" "}
            <Link
              href={`https://app.quereinstieg.com${ROUTES.Contact}`}
              style={anchor}
            >
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

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

export const TemplateName = "payment-failed-email"

export const TemplateStruct = object({
  customer_email: defaulted(string(), "batman@example.com"),
})

export type TemplateProps = Infer<typeof TemplateStruct>

const main = {
  backgroundColor: "#f6f9fc",
  fontFamily:
    '-apple-system,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Ubuntu,sans-serif',
}

const container = {
  backgroundColor: "#ffffff",
  margin: "0 auto",
  marginBottom: "64px",
  padding: "20px 0 48px",
}

const box = {
  padding: "0 48px",
}

const hr = {
  borderColor: "#e6ebf1",
  margin: "20px 0",
}

const paragraph = {
  color: "#777",
  fontSize: "16px",
  lineHeight: "24px",
  textAlign: "left" as const,
}

const anchor = {
  color: "#777",
}

const button = {
  backgroundColor: "#777",
  borderRadius: "5px",
  color: "#fff",
  display: "block",
  fontSize: "16px",
  fontWeight: "bold",
  textAlign: "center" as const,
  textDecoration: "none",
  width: "100%",
  padding: "10px",
}

export const Template = ({ customer_email }: TemplateProps) => (
  <Html>
    <Head />
    <Body style={main}>
      <Container style={container}>
        <Section style={box}>
          <Text style={paragraph}>This is our email body text</Text>
          <Button style={button} href="https://example.com">
            Action Button
          </Button>
          <Hr style={hr} />
          <Text style={paragraph}>
            This is text content with a{" "}
            <Link style={anchor} href="mailto:{email}">
              link
            </Link>
            .
          </Text>
        </Section>
      </Container>
    </Body>
  </Html>
)

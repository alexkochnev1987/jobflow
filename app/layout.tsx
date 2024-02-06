import "react-multi-carousel/lib/styles.css"
import "react-loading-skeleton/dist/skeleton.css"
// import "../i18n/config"
// also update if changing the css .storybook/preview.ts
import { inter } from "./fonts"
import "./globals.css"
import "./theme-config.css"
import cx from "classnames"
import { Theme } from "@radix-ui/themes"
import l18n from "../i18n/config"
import { ChakraProvider } from "@chakra-ui/react"

export const metadata = {
  title: l18n.t("SITE_TITLE"),
  description: l18n.t("META_DESCRIPTION"),
  twitter: {
    card: "summary_large_image",
    title: l18n.t("SITE_TITLE"),
    description: l18n.t("META_DESCRIPTION"),
    creator: "@guluarte",
  },
  metadataBase: new URL("http://localhost:3000"),
}

export default async function RootLayout({
  children,
}: {
  children: React.ReactNode
}) {
  return (
    <html lang="en">
      <body className={cx(inter.className)}>
        <ChakraProvider>
          <Theme accentColor="red">{children}</Theme>
        </ChakraProvider>
      </body>
    </html>
  )
}

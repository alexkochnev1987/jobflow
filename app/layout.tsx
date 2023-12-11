import "react-loading-skeleton/dist/skeleton.css"
import "../i18n/config"
// also update if changing the css .storybook/preview.ts
import "./globals.css"
import "./theme-config.css"
import cx from "classnames"
import { inter } from "./fonts"
import { Theme } from "@radix-ui/themes"
import t from "../i18n/config"

export const metadata = {
  title: t("SITE_TITLE"),
  description: t("META_DESCRIPTION"),
  twitter: {
    card: "summary_large_image",
    title: t("SITE_TITLE"),
    description: t("META_DESCRIPTION"),
    creator: "@guluarte",
  },
  metadataBase: new URL("http://localhost:3000"),
  themeColor: "#FFF",
}

export default async function RootLayout({
  children,
}: {
  children: React.ReactNode
}) {
  return (
    <html lang="en">
      <body className={cx(inter.variable)}>
        <Theme>{children}</Theme>
      </body>
    </html>
  )
}

import "../i18n/config"
import "@radix-ui/themes/styles.css"
import "react-loading-skeleton/dist/skeleton.css"
import "./globals.css"
import cx from "classnames"
import { sfPro, inter } from "./fonts"
import Nav from "@/components/layout/nav"
import Footer from "@/components/layout/footer"
import { Suspense } from "react"
import { Theme } from "@radix-ui/themes"
import t from "../i18n/config"
import NavBar from "@/components/layout/navbar"

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
        <Theme>
          <div>
            <NavBar session={null} />
            <main className="flex min-h-screen w-full">{children}</main>
          </div>
        </Theme>
      </body>
    </html>
  )
}

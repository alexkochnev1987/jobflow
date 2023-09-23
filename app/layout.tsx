import "@radix-ui/themes/styles.css"
import 'react-loading-skeleton/dist/skeleton.css'
import "./globals.css"
import cx from "classnames"
import { sfPro, inter } from "./fonts"
import Nav from "@/components/layout/nav"
import Footer from "@/components/layout/footer"
import { Suspense } from "react"
import { Theme } from "@radix-ui/themes"

export const metadata = {
  title: "Jobflow",
  description: "Jobflow.",
  twitter: {
    card: "summary_large_image",
    title: "Jobflow",
    description: "Jobflow",
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
      <body className={cx(sfPro.variable, inter.variable)}>
        <Theme>
          <div className="fixed h-screen w-full bg-gradient-to-br from-gray-50 via-white to-gray-100" />
          <Suspense fallback="...">
            {/* @ts-expect-error Server Component */}
            <Nav />
          </Suspense>
          <main className="flex min-h-screen w-full flex-col items-center  py-32">
            {children}
          </main>
          <Footer />
        </Theme>
      </body>
    </html>
  )
}

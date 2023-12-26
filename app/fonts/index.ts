import localFont from "next/font/local"
import { Inter, Lato } from "next/font/google"

export const sfPro = localFont({
  src: "./SF-Pro-Display-Medium.otf",
  variable: "--font-sf",
})

export const fontLato = Lato({
  variable: "--font-sf",
  subsets: ["latin"],
  weight: "100"
})

export const inter = Inter({
  variable: "--font-inter",
  subsets: ["latin"],
})

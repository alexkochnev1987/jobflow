"use client"
import Image from "next/image"
import Link from "next/link"
import useScroll from "@/lib/hooks/use-scroll"
import { Session } from "next-auth"
import Logo from "@/components/shared/icons/logo2.svg"
import World from "@/components/shared/icons/world.svg"
import UserDropdown from "./user-dropdown"
import { Button } from "@radix-ui/themes"
import { useTranslation } from "react-i18next"

export default function NavBar({ session }: { session: Session | null }) {
  const scrolled = useScroll(50)
  const { t } = useTranslation()
  // background: linear-gradient(90deg, #007CFB 0%, #01EBFF 100%);
  // bg-gradient-to-r from-blue-500 to-cyan-300
  return (
    <>
      <div
        className={`flex w-full justify-center bg-gradient-to-r from-blue-500 to-cyan-300`}
      >
        <div className="mx-5 flex h-16 w-full max-w-screen-xl items-center justify-start">
          <Link href="/" className="flex items-center font-display text-xl">
            <Logo />
          </Link>
        </div>
      </div>
    </>
  )
}

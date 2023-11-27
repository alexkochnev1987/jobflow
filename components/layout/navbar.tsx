"use client"
import Image from "next/image"
import Link from "next/link"
import useScroll from "@/lib/hooks/use-scroll"
import { Session } from "next-auth"
import Logo from "@/components/shared/icons/logo.svg"
import World from "@/components/shared/icons/world.svg"
import UserDropdown from "./user-dropdown"
import { Button } from "@radix-ui/themes"
import { useTranslation } from "react-i18next"

export default function NavBar({ session }: { session: Session | null }) {
  const scrolled = useScroll(50)
  const { t } = useTranslation()

  return (
    <>
      <div
        className={`fixed top-0 flex w-full justify-center ${
          scrolled
            ? "border-b border-gray-200 bg-white/50 backdrop-blur-xl"
            : "bg-white/0"
        } z-30 transition-all`}
      >
        <div className="mx-5 flex h-16 w-full max-w-screen-xl items-center justify-between">
          <Link href="/" className="flex items-center font-display text-xl">
            <Logo />
          </Link>
          <div className="flex flex-row gap-14">
            <Link href="/" className="flex items-center font-display text-xl">
              {t("About Us")}
            </Link>
            <Link href="/" className="flex items-center font-display text-xl">
              {t("Blog")}
            </Link>
            <Link href="/" className="flex items-center font-display text-xl">
              {t("FAQ")}
            </Link>
          </div>
          <div className="flex flex-row gap-5 align-middle">
            <World className="m-auto" />
            {session ? (
              <UserDropdown session={session} />
            ) : (
              <Button
                variant="outline"
                radius="full"
                size="4"
                className="w-44 px-6 py-4"
              >
                {t("Log In")}
              </Button>
            )}
          </div>
        </div>
      </div>
    </>
  )
}

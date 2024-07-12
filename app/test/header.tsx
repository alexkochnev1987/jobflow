"use client"
import Link from "next/link"
import Logo from "@/icons/logo.svg"
import { ChevronLeft } from "lucide-react"
import { Text } from "@radix-ui/themes"
import { userStore } from "../client/store"
import useIsMobile from "@/lib/hooks/use-is-mobile"

export default function Header() {
  const isMobile = useIsMobile()
  const store = userStore()
  const answered = store.responses.length + 1
  const totalQuestions = store.totalQuestions + 1

  return (
    <div className={`flex w-full justify-center bg-white/0`}>
      <div className="mx-5 flex h-16 w-full max-w-screen-xl items-center justify-between">
        <div>
          {!isMobile && store.responses.length > 0 && (
            <ChevronLeft
              onClick={() => store.undoLast()}
              className="cursor-pointer"
            />
          )}
        </div>
        <Link
          href="https://quereinstieg.com/"
          className="font-display flex items-center text-xl"
        >
          <Logo />
        </Link>
        <Text>
          {answered < totalQuestions && (
            <>
              {answered}/{totalQuestions}
            </>
          )}
        </Text>
      </div>
    </div>
  )
}

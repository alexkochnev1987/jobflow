"use client"
import Link from "next/link"
import Logo from "@/icons/logo.svg"
import { ChevronLeft } from "lucide-react"
import { Text } from "@radix-ui/themes"
import { userStore } from "../client/store"

export default function Header() {
  const store = userStore()
  const answered = store.responses.length + 1
  const totalQuestions = store.totalQuestions + 1

  return (
    <div className={`flex w-full justify-center bg-white/0`}>
      <div className="mx-5 flex h-16 w-full max-w-screen-xl items-center justify-between">
        <div>
          {store.responses.length > 0 && (
            <ChevronLeft
              onClick={() => store.undoLast()}
              className="cursor-pointer"
            />
          )}
        </div>
        <Link href="https://shiftyourcareer.de/" className="flex items-center font-display text-xl">
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
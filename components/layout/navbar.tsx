import React, { ReactElement } from "react"
import Link from "next/link"
import { cn } from "@/lib/utils"
import { Session } from "next-auth"
import UserDropdown from "./user-dropdown"

// import { ReactComponent as HeartFilledIcon } from '../../assets/icons/icon_heart_filled.svg'
import Logo from "@/components/shared/icons/logo2.svg"
import World from "@/components/shared/icons/world.svg"

export type Props = React.InputHTMLAttributes<HTMLDivElement> & {
  session?: Session
}
export const NavBar = ({ session, ...rest }: Props): ReactElement => {
  return (
    <div
      className={cn(
        `flex w-full justify-center bg-gradient-to-r from-blue-500 to-cyan-300`,
        rest.className,
      )}
    >
      <div className="mx-auto flex h-16 w-full max-w-6xl   justify-between">
        <Link href="/" className="flex items-center font-display text-xl">
          <Logo />
        </Link>
        <div className="my-auto flex flex-row gap-2 self-end">
          <World />
          {session && <UserDropdown session={session} />}
        </div>
      </div>
    </div>
  )
}

export default NavBar

"use client"
import React, { ReactElement, useEffect } from "react"
import Link from "next/link"
import { cn } from "@/lib/utils"
import { Session } from "next-auth"
import UserDropdown from "./user-dropdown"

// import { ReactComponent as HeartFilledIcon } from '../../assets/icons/icon_heart_filled.svg'
import Logo from "@/icons/logo2.svg"
import CompanyDropdown from "./company-dropdown"



export type Props = React.InputHTMLAttributes<HTMLDivElement> & {
  session?: Session
  isCompany?: boolean
}

export const NavBar = ({
  session,
  isCompany,
  ...rest
}: Props): ReactElement => {
  useEffect(() => {}, [session])
  return (
    <div
      className={cn(
        `flex w-full justify-center bg-gradient-to-r  from-lightGreen to-mintGreen px-10 py-1`,
        rest.className,
      )}
    >
      <div className="mx-auto flex h-10 w-full max-w-6xl   justify-between">
        <Link href="/" className="flex items-center font-display text-xl">
          <Logo />
        </Link>
        <div className="my-auto flex flex-row gap-2 self-end">
          {session && !isCompany && <UserDropdown session={session} />}
          {session && isCompany && <CompanyDropdown session={session} />}
        </div>
      </div>
    </div>
  )
}

export default NavBar

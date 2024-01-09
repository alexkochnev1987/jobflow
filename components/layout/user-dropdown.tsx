"use client"

import { useState } from "react"
import { signOut } from "next-auth/react"
import {  LayoutDashboard, LogOut, Settings } from "lucide-react"
import Popover from "@/components/shared/popover"
import { Session } from "next-auth"
import Link from "next/link"
import { ROUTES } from "@/lib/constants"
import l18n from "@/i18n/config"
import UserIcon from "@/icons/user.svg"

export default function UserDropdown({ session }: { session: Session }) {
  const { email, image } = session?.user || {}
  const [openPopover, setOpenPopover] = useState(false)

  if (!email) return null

  return (
    <div className="relative text-left">
      <Popover
        content={
          <div className="w-full rounded-md bg-white sm:w-56">
            <Link
              className="relative flex w-full items-center justify-start space-x-2 rounded-md p-2 text-left text-sm transition-all duration-75 hover:bg-gray-100"
              href={ROUTES.DashBoard}
            >
              <LayoutDashboard className="h-4 w-4" />
              <p className="text-sm">{l18n.t("Dashboard")}</p>
            </Link>
            <Link
              className="relative flex w-full items-center justify-start space-x-2 rounded-md p-2 text-left text-sm transition-all duration-75 hover:bg-gray-100"
              href={ROUTES.Settings}
            >
              <Settings className="h-4 w-4" />
              <p className="text-sm">{l18n.t("Settings")}</p>
            </Link>
            <button
              className="relative flex w-full items-center justify-start space-x-2 rounded-md p-2 text-left text-sm transition-all duration-75 hover:bg-gray-100"
              onClick={() => signOut()}
            >
              <LogOut className="h-4 w-4" />
              <p className="text-sm">{l18n.t("Logout")}</p>
            </button>
          </div>
        }
        align="end"
        openPopover={openPopover}
        setOpenPopover={setOpenPopover}
      >
        <button
          onClick={() => setOpenPopover(!openPopover)}
          className="flex h-8 w-8 items-center justify-center overflow-hidden rounded-full transition-all duration-75 focus:outline-none active:scale-95 sm:h-9 sm:w-9"
        >
          <UserIcon />
        </button>
      </Popover>
    </div>
  )
}

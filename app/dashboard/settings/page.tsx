"use server"
import CourseCarousel from "@/components/dashboard/course-carousel"
import TestsCarousel from "@/components/dashboard/test-carousel"
import BackIcon from "@/icons/back.svg"

import Link from "next/link"
import { ROUTES } from "@/lib/constants"
import { getCareer } from "@/app/actions/careers"
import { Career } from "@/components/shared/career-card"
import React from "react"
import Skeleton from "react-loading-skeleton"
import { Test } from "@/components/shared/test-card"
import { Course } from "@/components/shared/course-card"
import l18n from "@/i18n/config"
import { Button } from "@/components/ui/button"
import { Flex, TextFieldInput } from "@radix-ui/themes"
import SettingsClient from "./settings-client"
import { deleteUser, updatePassword } from "@/app/actions/user"

export default async function Page() {
  return (
    <div>
      <Link href={ROUTES.DashBoard}>
        <h1 className="flex cursor-pointer flex-row items-center text-xl font-bold">
          <BackIcon /> {l18n.t("Settings")}
        </h1>
      </Link>

      <SettingsClient deleteUser={deleteUser} updatePassword={updatePassword} />
    </div>
  )
}

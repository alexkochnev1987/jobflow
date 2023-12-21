"use client"
/* eslint-disable @next/next/no-img-element */
import Clock from "@/icons/clock.svg"
import Location from "@/icons/location.svg"
import Tag from "@/icons/tag.svg"
import Bag from "@/icons/bag.svg"

import Link from "next/link"
import { ROUTES } from "@/lib/constants"
import AddIcon from "@/icons/add.svg"
import EditIcon from "@/icons/edit.svg"
import DeleteIcon from "@/icons/delete.svg"
import React, { useState } from "react"
import Skeleton from "react-loading-skeleton"
import { Box, Checkbox, Container, Flex } from "@radix-ui/themes"
import Modal from "@/components/shared/modal"
import { Input } from "@/components/shared/input"
import { useForm } from "react-hook-form"
import { yupResolver } from "@hookform/resolvers/yup"
import { schemaNewCourse } from "@/lib/schemas"

export default function CompanyCourses() {
  return (
    <Container>
      <Flex direction="row" justify="between">
        <h1 className="text-xl font-medium leading-8 text-gray-900">
          Trainings
        </h1>

        <Link href="/dashboard/company/courses/add">
          <AddIcon className="cursor-pointer" />
        </Link>
      </Flex>

      <h2 className="text-center text-lg">No trainings found.</h2>

      <Flex
        direction="column"
        className="my-4 rounded-lg border border-gray-300 p-4 align-middle shadow-sm"
      >
        <Flex width="100%" direction="row">
          <Flex className="w-1/5 p-2" justify="center">
            <img src="https://placehold.co/145x145" alt="Course logo" />
          </Flex>
          <Flex direction="column" grow="1" className="w-2/5">
            <p className="text-xs font-medium leading-4 text-gray-500">
              COURSE
            </p>
            <h2 className="text-xl font-bold leading-8 text-black">
              Web development
            </h2>
            <p className="text-sm font-normal leading-snug text-slate-700">
              Quisque a augue ut ante elementum condimentum. Suspendisse at
              pretium felis. Nulla facilisi. Pellentesque vel ipsum velit.
              Vivamus vulputate sapien a est aliquet bibendum.
            </p>
          </Flex>
          <Flex direction="column" width="1" className="w-1/5">
            <div className="mt-1.5 flex items-center gap-2 self-start">
              <Clock className="fill-slate-700" />
              <div className="grow self-stretch whitespace-nowrap text-sm leading-6 text-slate-700">
                <span className="font-semibold">Pace:</span>
                <span className=""> Part-time, full-time</span>
              </div>
            </div>
            <div className="mt-1.5 flex items-center gap-2 self-start pr-14 max-md:pr-5">
              <Location />
              <div className="grow self-stretch whitespace-nowrap text-sm leading-6 text-slate-700">
                <span className="font-semibold">Location:</span>
                <span className=""> Remote</span>
              </div>
            </div>
            <div className="mt-1.5 flex items-center gap-2 self-start">
              <Tag />
              <div className="grow self-stretch whitespace-nowrap text-sm leading-6 text-slate-700">
                <span className="font-semibold">Price: </span>
                <span className=""> 8.800€</span>
              </div>
            </div>
          </Flex>
        </Flex>
        <Flex justify="end" gap="2">
          <EditIcon className="cursor-pointer" />
          <DeleteIcon className="cursor-pointer" />
        </Flex>
      </Flex>
    </Container>
  )
}

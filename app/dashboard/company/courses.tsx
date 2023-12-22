"use client"
/* eslint-disable @next/next/no-img-element */
import Clock from "@/icons/clock.svg"
import Location from "@/icons/location.svg"
import Tag from "@/icons/tag.svg"
import Link from "next/link"
import AddIcon from "@/icons/add.svg"
import EditIcon from "@/icons/edit.svg"
import DeleteIcon from "@/icons/delete.svg"
import React, { useState } from "react"
import { Button, Container, Flex } from "@radix-ui/themes"
import { formatArray, getImageFullUrl, salaryFormatter } from "@/lib/utils"

import {
  AlertDialog,
  AlertDialogAction,
  AlertDialogCancel,
  AlertDialogContent,
  AlertDialogDescription,
  AlertDialogFooter,
  AlertDialogHeader,
  AlertDialogTitle,
} from "@/components/ui/alert-dialog"

export default function CompanyCourses({ courses }) {
  const [open, setOpen] = useState(false)
  return (
    <Container>
      <AlertDialog open={open}>
        <AlertDialogContent>
          <AlertDialogHeader>
            <AlertDialogTitle>Are you absolutely sure?</AlertDialogTitle>
            <AlertDialogDescription>
              This action cannot be undone. This will permanently delete the
              course.
            </AlertDialogDescription>
          </AlertDialogHeader>
          <AlertDialogFooter>
            <AlertDialogCancel onClick={() => setOpen(false)}>
              Cancel
            </AlertDialogCancel>
            <AlertDialogAction className="bg-red-700 text-white hover:bg-red-500">
              Continue
            </AlertDialogAction>
          </AlertDialogFooter>
        </AlertDialogContent>
      </AlertDialog>
      <Flex direction="row" justify="between">
        <h1 className="text-xl font-medium leading-8 text-gray-900">
          Trainings
        </h1>

        <Link href="/dashboard/company/courses/add">
          <AddIcon className="cursor-pointer" />
        </Link>
      </Flex>

      {courses.length === 0 && (
        <h2 className="text-center text-lg">No trainings found.</h2>
      )}

      {courses.map((course) => (
        <Flex
          key={course.id}
          direction="column"
          className="my-4 rounded-lg border border-gray-300 p-4 align-middle shadow-sm"
        >
          <Flex width="100%" direction="row">
            <Flex className="w-1/5 p-2" justify="center">
              <img src={getImageFullUrl(course.image)} alt="Course logo" />
            </Flex>
            <Flex direction="column" grow="1" className="w-2/5">
              <p className="text-xs font-medium leading-4 text-gray-500">
                COURSE
              </p>
              <h2 className="text-xl font-bold leading-8 text-black">
                {course.name}
              </h2>
              <p className="text-sm font-normal leading-snug text-slate-700">
                {course.description}
              </p>
            </Flex>
            <Flex direction="column" width="1" className="w-1/5">
              <div className="mt-1.5 flex items-center gap-2 self-start">
                <Clock className="fill-slate-700" />
                <div className="grow self-stretch whitespace-nowrap text-sm leading-6 text-slate-700">
                  <span className="font-semibold">Pace:</span>
                  <span className=""> {formatArray(course.pace)}</span>
                </div>
              </div>
              <div className="mt-1.5 flex items-center gap-2 self-start pr-14 max-md:pr-5">
                <Location />
                <div className="grow self-stretch whitespace-nowrap text-sm leading-6 text-slate-700">
                  <span className="font-semibold">Location:</span>
                  <span className=""> {course.location}</span>
                </div>
              </div>
              <div className="mt-1.5 flex items-center gap-2 self-start">
                <Tag />
                <div className="grow self-stretch whitespace-nowrap text-sm leading-6 text-slate-700">
                  <span className="font-semibold">Price: </span>
                  <span className=""> {salaryFormatter(course.price)}€</span>
                </div>
              </div>
            </Flex>
          </Flex>
          <Flex justify="end" gap="2">
            <Link href={`/dashboard/company/courses/edit/${course.id}`}>
              <EditIcon className="cursor-pointer" />
            </Link>
            <DeleteIcon
              className="cursor-pointer"
              onClick={() => setOpen(true)}
            />
          </Flex>
        </Flex>
      ))}
    </Container>
  )
}

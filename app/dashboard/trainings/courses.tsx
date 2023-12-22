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
import { LoadingDots } from "@/components/shared/icons"

export default function CompanyCourses({ courses }) {
  const [deleteId, setDeleteId] = useState(0)
  const [loading, setLoading] = useState(false)

  const onDelete = async () => {
    setLoading(true)

    try {
      const res = await fetch(`/api/course?id=${deleteId}`, {
        method: "DELETE",
        headers: {
          "Content-Type": "application/json",
        },
      })

      setLoading(false)
      setDeleteId(0)
      if (!res.ok) {
        return
      }
      // remove course from courses array
      courses = courses.filter((course) => course.id !== deleteId)
    } catch (error: any) {
      setLoading(false)
    }
  }
  return (
    <Container>
      <AlertDialog open={deleteId > 0}>
        <AlertDialogContent>
          <AlertDialogHeader>
            <AlertDialogTitle>Are you absolutely sure?</AlertDialogTitle>
            <AlertDialogDescription>
              This action cannot be undone. This will permanently delete the
              course.
            </AlertDialogDescription>
          </AlertDialogHeader>
          <AlertDialogFooter>
            <AlertDialogCancel onClick={() => setDeleteId(0)}>
              Cancel
            </AlertDialogCancel>
            <AlertDialogAction
              className="bg-red-700 text-white hover:bg-red-500"
              onClick={onDelete}
            >
              {loading ? <LoadingDots color="#ffffff" /> : "Delete"}
            </AlertDialogAction>
          </AlertDialogFooter>
        </AlertDialogContent>
      </AlertDialog>
      <Flex direction="row" justify="between">
        <h1 className="text-xl font-medium leading-8 text-gray-900">
          Trainings
        </h1>

        <Link href="/dashboard/trainings/courses/add">
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
            <Link href={`/dashboard/trainings/courses/edit/${course.id}`}>
              <EditIcon className="cursor-pointer" />
            </Link>
            <DeleteIcon
              className="cursor-pointer"
              onClick={() => setDeleteId(course.id)}
            />
          </Flex>
        </Flex>
      ))}
    </Container>
  )
}

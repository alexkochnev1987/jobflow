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
  const [showCourseModal, setAddCourseModal] = useState(false)
  const {
    register,
    getValues,
    setValue,
    handleSubmit,
    watch,
    formState: { errors },
  } = useForm({
    resolver: yupResolver(schemaNewCourse),
    defaultValues: { business: "training", country: "Germany" },
  })
  return (
    <Container>
      <Flex direction="row" justify="between">
        <h1 className="text-xl font-medium leading-8 text-gray-900">
          Trainings
        </h1>

        <AddIcon
          className="cursor-pointer"
          onClick={() => setAddCourseModal(true)}
        />
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

      <Modal
        showModal={showCourseModal}
        setShowModal={() => {
          setAddCourseModal(false)
        }}
      >
        <div className="w-1/2 rounded-lg border border-gray-400 bg-white p-4 shadow-sm">
          <Flex direction="column" justify="between" className="w-full" gap="2">
            <Flex direction="row" justify="between">
              <h1 className="text-xl font-medium leading-8 text-gray-900">
                Add course
              </h1>
              <Link
                onClick={(e) => {
                  e.preventDefault()
                  setAddCourseModal(false)
                }}
                href="#"
              >
                <AddIcon className="rotate-45 cursor-pointer" />
              </Link>
            </Flex>
            <p>image</p>
            <Input {...register("name")} placeholder="Name" />
            <textarea
              {...register("description")}
              className="h-20"
              placeholder="Description"
              type="textarea"
              rows="3"
            />

            <Input {...register("price")} placeholder="Price" type="number" />
            <div>
              <Checkbox /> <label>Sponsorship</label>
            </div>
            <label htmlFor="">Location</label>
            <div>
              <Checkbox /> Remote
            </div>
            <div>
              <Checkbox /> On-campus
            </div>
            <p>startdates</p>
            <label htmlFor="">Pace</label>
            <div>
              <Checkbox /> Part-time
            </div>
            <div>
              <Checkbox /> Full-time
            </div>
            <label htmlFor="">Type</label>
            <div>
              <Checkbox /> Training
            </div>
            <div>
              <Checkbox /> Apprenticenship
            </div>
          </Flex>
        </div>
      </Modal>
    </Container>
  )
}

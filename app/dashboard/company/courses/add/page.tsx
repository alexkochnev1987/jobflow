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

import {
  Box,
  Button,
  Checkbox,
  Container,
  Flex,
  PopoverContent,
  TextArea,
  TextFieldInput,
} from "@radix-ui/themes"
import { useForm } from "react-hook-form"
import BackIcon from "@/icons/back.svg"
import { yupResolver } from "@hookform/resolvers/yup"
import { schemaNewCourse } from "@/lib/schemas"
import ImageUploading from "react-images-uploading"

import { cn } from "@/lib/utils"
import { CalendarDays } from "lucide-react"
import { Popover, PopoverTrigger } from "@radix-ui/react-popover"
import { format } from "date-fns"
import { Calendar } from "@/components/ui/calendar"

export default function CompanyCourses() {
  const [loading, setLoading] = useState(false)
  const [error, setError] = useState("")
  const [images, setImages] = React.useState([])
  const {
    register,
    getValues,
    setValue,
    handleSubmit,
    watch,
    formState: { errors },
  } = useForm({
    resolver: yupResolver(schemaNewCourse),
  })

  watch("start_date")

  const { start_date } = getValues()

  console.log(errors)

  const onChange = (imageList, addUpdateIndex) => {
    // data for submit
    console.log(imageList, addUpdateIndex)
    setImages(imageList)
    setValue("image", imageList[0].data_url)
  }

  const onSubmit = async (data) => {
    console.log("onSubmit", data, images)
    return
    setLoading(true)

    try {
      const res = await fetch("/api/company", {
        method: "POST",
        body: JSON.stringify(data),
        headers: {
          "Content-Type": "application/json",
        },
      })

      setLoading(false)
      if (!res.ok) {
        setError((await res.json()).message)
        return
      }
    } catch (error: any) {
      setLoading(false)
      setError(error)
    }
  }

  return (
    <form onSubmit={handleSubmit(onSubmit)}>
      <Flex direction="column" gap="3">
        <Flex direction="row" align="center">
          <Link href="/dashboard/company">
            <BackIcon />
          </Link>
          <h1 className="text-xl font-medium leading-8 text-gray-900">
            Add course
          </h1>
        </Flex>
        <TextFieldInput {...register("name")} placeholder="Name" />
        {errors.name && <p className="text-red-700">{errors.name.message}</p>}
        <TextArea
          {...register("description")}
          className="h-20"
          placeholder="Description"
          rows={3}
        />
        {errors.description && (
          <p className="text-red-700">{errors.description.message}</p>
        )}

        <Flex direction="row" gap="1" justify="between">
          <Flex>
            <Popover>
              <PopoverTrigger asChild>
                <Button
                  variant={"outline"}
                  className={cn(
                    "w-[240px] pl-3 text-left font-normal",
                    !start_date && "text-muted-foreground",
                  )}
                >
                  {start_date ? (
                    format(start_date, "PPP")
                  ) : (
                    <span>Pick a date</span>
                  )}
                  <CalendarDays className="ml-auto h-4 w-4 opacity-50" />
                </Button>
              </PopoverTrigger>
              <PopoverContent className="w-auto p-0" align="start">
                <Calendar
                  mode="single"
                  disabled={(date) => date < new Date()}
                  initialFocus
                  onSelect={(v) => setValue("start_date", v)}
                />
              </PopoverContent>
            </Popover>
          </Flex>
          <Flex direction="row" gap="1" align="start">
            <TextFieldInput
              {...register("price")}
              placeholder="Price"
              type="number"
            />
            <Flex direction="row" align="center" gap="1">
              <Checkbox /> <label>Sponsorship</label>
            </Flex>
          </Flex>

          <Flex>
            <ImageUploading
              value={images}
              onChange={onChange}
              maxNumber={1}
              dataURLKey="data_url"
            >
              {({
                imageList,
                onImageUpload,
                onImageUpdate,
                onImageRemove,
                dragProps,
                errors,
              }) => (
                <div className="upload__image-wrapper">
                  {imageList.length === 0 && (
                    <Button
                      className="h-10"
                      onClick={onImageUpload}
                      {...dragProps}
                    >
                      Upload image
                    </Button>
                  )}
                  {imageList.map((image, index) => (
                    <div key={index} className="image-item">
                      <img src={image["data_url"]} alt="" width="100" />
                      <Flex gap="1">
                        <button onClick={() => onImageUpdate(index)}>
                          Update
                        </button>
                        <button onClick={() => onImageRemove(index)}>
                          Remove
                        </button>
                      </Flex>
                    </div>
                  ))}
                  {errors && (
                    <div>
                      {errors.maxNumber && (
                        <span>Number of selected images exceed maxNumber</span>
                      )}
                      {errors.acceptType && (
                        <span>Your selected file type is not allow</span>
                      )}
                      {errors.maxFileSize && (
                        <span>Selected file size exceed maxFileSize</span>
                      )}
                      {errors.resolution && (
                        <span>
                          Selected file is not match your desired resolution
                        </span>
                      )}
                    </div>
                  )}
                </div>
              )}
            </ImageUploading>
          </Flex>
        </Flex>

        {errors.price && <p className="text-red-700">{errors.price.message}</p>}

        <Flex direction="row" wrap="wrap" gap="2">
          <Flex direction="column">
            <label htmlFor="" className="font-medium">
              Location
            </label>
            <Flex direction="row" align="center" gap="1">
              <Checkbox {...register("remote")} /> <label>Remote</label>
            </Flex>
            <Flex direction="row" align="center" gap="1">
              <Checkbox {...register("on_campus")} /> <label>On-campus</label>
            </Flex>
          </Flex>
          <Flex direction="column">
            <label htmlFor="" className="font-medium">
              Pace
            </label>
            <Flex direction="row" align="center" gap="1">
              <Checkbox {...register("part_time")} /> <label>Part-time</label>
            </Flex>
            <Flex direction="row" align="center" gap="1">
              <Checkbox {...register("full_time")} /> <label>Full-time</label>
            </Flex>
          </Flex>
          <Flex direction="column">
            <label htmlFor="" className="font-medium">
              Type
            </label>
            <Flex direction="row" align="center" gap="1">
              <Checkbox {...register("training")} /> <label>Training</label>
            </Flex>
            <Flex direction="row" align="center" gap="1">
              <Checkbox {...register("apprenticenship")} />{" "}
              <label>Apprenticenship</label>
            </Flex>
          </Flex>
        </Flex>
        <Button type="submit" className="!bg-rose-500 hover:!bg-rose-400">
          Add Course
        </Button>
      </Flex>
    </form>
  )
}

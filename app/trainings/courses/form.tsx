"use client"
/* eslint-disable @next/next/no-img-element */
import Link from "next/link"
import React, { useState } from "react"

import {
  Button,
  Checkbox,
  Flex,
  PopoverContent,
  TextArea,
  TextFieldInput
} from "@radix-ui/themes"
import { useForm } from "react-hook-form"
import BackIcon from "@/icons/back.svg"
import { yupResolver } from "@hookform/resolvers/yup"
import { schemaNewCourse } from "@/lib/schemas"
import ImageUploading from "react-images-uploading"

import { cn, getImageFullUrl } from "@/lib/utils"
import { CalendarDays } from "lucide-react"
import { Popover, PopoverTrigger } from "@radix-ui/react-popover"
import { format } from "date-fns"
import { Calendar } from "@/components/ui/calendar"
import { LoadingDots } from "@/components/shared/icons"
import { ROUTES } from "@/lib/constants"

export default function CourseForm({ defaultValues = {} }) {
  const [loading, setLoading] = useState(false)
  const [error, setError] = useState("")
  const [images, setImages] = useState([])
  const {
    register,
    getValues,
    setValue,
    handleSubmit,
    watch,
    formState: { errors },
  } = useForm({
    resolver: yupResolver(schemaNewCourse),
    values: {
      ...defaultValues,
    },
  })

  watch("image")
  watch("start_date")
  watch("apprenticenship")

  const { start_date, id, apprenticenship, image } = getValues()

  console.log(apprenticenship)

  const onChange = (imageList, addUpdateIndex) => {
    // data for submit
    console.log(imageList, addUpdateIndex)
    setImages(imageList)
    setValue("image", imageList[0].data_url)
  }

  const onSubmit = async (data) => {
    console.log("onSubmit", data, images)
    setLoading(true)

    try {
      const res = await fetch("/api/course", {
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
      alert("Course updated")
    } catch (error: any) {
      setLoading(false)
      setError(error)
    }
  }

  return (
    <form onSubmit={handleSubmit(onSubmit)} className="mx-auto max-w-md">
      <Flex direction="column" gap="3">
        <Flex direction="row" align="center">
          <Link href={ROUTES.Trainings}>
            <BackIcon />
          </Link>
          <h1 className="text-xl font-medium leading-8 text-gray-900">
            {id ? "Ausbildung bearbeiten" : "Ausbildung hinzufügen"}
          </h1>
        </Flex>
        <TextFieldInput {...register("name")} 
          placeholder="Name" 
          id="name"
          name="name"
          className="bg-lightGray text-sm border-1 border-darkGray placeholder:text-darkGray"
        />
        {errors.name && <p className="text-red-700">{errors.name.message}</p>}
        <TextFieldInput {...register("location")} 
          placeholder="Ort" 
          id="location"
          name="location"
          className="bg-lightGray text-sm border-1 border-darkGray placeholder:text-darkGray"
        />
        {errors.location && (
          <p className="text-red-700">{errors.location.message}</p>
        )}
        <TextFieldInput
          {...register("price")}
          placeholder="Price"
          type="number"
        />
        {errors.price && <p className="text-red-700">{errors.price.message}</p>}
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
                  variant={"soft"}
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
                  {image && imageList.length === 0 && (
                    <img
                      src={getImageFullUrl(image)}
                      alt="Course logo"
                      className="mb-2 w-48"
                    />
                  )}
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
            <label htmlFor="part_time" className="font-medium">
              Pace
            </label>
            <Flex direction="row" align="center" gap="1">
              <Checkbox {...register("part_time")} /> <label htmlFor="part_time" >Part-time</label>
            </Flex>
            <Flex direction="row" align="center" gap="1">
              <Checkbox {...register("full_time")} /> <label htmlFor="full_time" >Full-time</label>
            </Flex>
          </Flex>
          <Flex direction="column">
            <label htmlFor="training" className="font-medium">
              Type
            </label>
            <Flex direction="row" align="center" gap="1">
              <Checkbox {...register("training")} /> <label htmlFor="training">Training</label>
            </Flex>
            <Flex direction="row" align="center" gap="1">
              <Checkbox {...register("apprenticenship")} value="on" />
              <label htmlFor="apprenticenship">Apprenticenship</label>
            </Flex>
          </Flex>
        </Flex>
        <Flex direction="row" align="center" gap="1">
          <Checkbox {...register("sponsonrship")} />
          <label htmlFor="sponsonrship">Sponsorship</label>
        </Flex>
        {error && <p className="text-red-700">{error}</p>}
        <Button
          type="submit"
          className="!bg-rose-500 hover:!bg-rose-400"
          disabled={loading}
        >
          {loading ? <LoadingDots color="#ffffff" /> : "Save course"}
        </Button>
      </Flex>
    </form>
  )
}

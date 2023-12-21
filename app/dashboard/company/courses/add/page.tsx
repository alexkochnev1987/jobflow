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
import { Input, Textarea } from "@/components/shared/input"
import { useForm } from "react-hook-form"
import BackIcon from "@/icons/back.svg"
import { yupResolver } from "@hookform/resolvers/yup"
import { schemaNewCourse } from "@/lib/schemas"
import ImageUploading from "react-images-uploading"
import Button from "@/components/shared/button"

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

  console.log(errors)

  const onChange = (imageList, addUpdateIndex) => {
    // data for submit
    console.log(imageList, addUpdateIndex)
    setImages(imageList)
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
        <Input {...register("name")} placeholder="Name" />

        <Flex direction="row" gap="1" align="center">
          <Textarea
            {...register("description")}
            className="h-20"
            placeholder="Description"
            rows={3}
          />
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
              isDragging,
              dragProps,
              errors,
            }) => (
              <div className="upload__image-wrapper">
                {imageList.length === 0 && (
                  <Button
                    style={isDragging ? { color: "red" } : undefined}
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

        <Flex direction="row" gap="1">
          <Input
            {...register("price")}
            placeholder="Price"
            type="number"
            className="w-1/2"
          />
          <Flex direction="row" align="center" gap="1">
            <Checkbox /> <label>Sponsorship</label>
          </Flex>
        </Flex>
        <p>startdates</p>
        <Flex direction="row" wrap="wrap" gap="2">
          <Flex direction="column">
            <label htmlFor="">Location</label>
            <Flex direction="row" align="center" gap="1">
              <Checkbox {...register("remote")} /> <label>Remote</label>
            </Flex>
            <Flex direction="row" align="center" gap="1">
              <Checkbox {...register("on_campus")} /> <label>On-campus</label>
            </Flex>
          </Flex>
          <Flex direction="column">
            <label htmlFor="">Pace</label>
            <Flex direction="row" align="center" gap="1">
              <Checkbox {...register("part_time")} /> <label>Part-time</label>
            </Flex>
            <Flex direction="row" align="center" gap="1">
              <Checkbox {...register("full_time")} /> <label>Full-time</label>
            </Flex>
          </Flex>
          <Flex direction="column">
            <label htmlFor="">Type</label>
            <Flex direction="row" align="center" gap="1">
              <Checkbox {...register("training")} /> <label>Training</label>
            </Flex>
            <Flex direction="row" align="center" gap="1">
              <Checkbox {...register("apprenticenship")} />{" "}
              <label>Apprenticenship</label>
            </Flex>
          </Flex>
        </Flex>
        <Button
          intent="primary"
          type="submit"
          className="!bg-rose-500 hover:!bg-rose-400"
        >
          Add Course
        </Button>
      </Flex>
    </form>
  )
}

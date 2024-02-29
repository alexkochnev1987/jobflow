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
        <Flex className="form-group mt-5 flex flex-col gap-2">
          <h2 className="text-sm font-bold">Allgemein</h2>
          <TextFieldInput {...register("name")} 
            placeholder="Name" 
            id="name"
            name="name"
            className="flex h-10 w-full rounded-md border border-input bg-background px-3 py-2 text-sm ring-offset-background file:border-0 file:bg-transparent file:text-sm file:font-medium placeholder:text-muted-foreground focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50 text-base py-2 px-4 bg-lightGray border-1 border-darkGray placeholder:text-darkGray"
          />
          {errors.name && <p className="text-red-700">{errors.name.message}</p>}
          <TextArea
            {...register("description")}
            className="flex h-10 w-full rounded-md border border-input bg-background px-3 py-2 !text-sm ring-offset-background file:border-0 file:bg-transparent file:text-sm file:font-medium placeholder:text-muted-foreground focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50 text-base !py-2 !px-4 !bg-lightGray !border-1 border-darkGray placeholder:text-darkGray"
            placeholder="Beschreibung"
            rows={5}
          />
          {errors.description && (
            <p className="text-red-700">{errors.description.message}</p>
          )}
          <TextFieldInput {...register("location")} 
            placeholder="Ort" 
            id="location"
            name="location"
            className="flex h-10 w-full rounded-md border border-input bg-background px-3 py-2 text-sm ring-offset-background file:border-0 file:bg-transparent file:text-sm file:font-medium placeholder:text-muted-foreground focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50 text-base py-2 px-4 bg-lightGray border-1 border-darkGray placeholder:text-darkGray"
          />
          {errors.location && (
            <p className="text-red-700">{errors.location.message}</p>
          )}
        </Flex>
        <Flex className="form-group mt-5 flex-col gap-2">
          <h2 className="text-sm font-bold">Datum & Preis</h2>
          <div className="flex flex-row gap-10">
            <Popover>
              <PopoverTrigger asChild>
                <Button
                  variant={"soft"}
                  className={cn(
                    "w-[240px] pl-3 text-left font-normal !bg-lightGray !text-black",
                    !start_date && "text-muted-foreground",
                  )}
                >
                  {start_date ? (
                    format(start_date, "PPP")
                  ) : (
                    <span>Startdatum</span>
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
            <TextFieldInput
              {...register("price")}
              placeholder="Preis in €"
              type="number"
              className="flex h-10 w-full rounded-md border border-input bg-background px-3 py-2 text-sm ring-offset-background file:border-0 file:bg-transparent file:text-sm file:font-medium placeholder:text-muted-foreground focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50 text-base py-2 px-4 bg-lightGray border-1 border-darkGray placeholder:text-darkGray"
            />
          </div>
          {errors.price && <p className="text-red-700">{errors.price.message}</p>}
        </Flex>
        <Flex direction="row" gap="1" justify="between" className="form-group mt-5 flex-col gap-2">
          <h2 className="text-sm font-bold">Medien</h2>
          <p className="text-sm">Erregen Sie durch ein ansprechendes Bild ihre Aufmerksamkeit</p>
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
                      className="h-10 !bg-lightGreen"
                      onClick={onImageUpload}
                      {...dragProps}
                    >
                      Bild hochladen
                    </Button>
                  )}
                  {imageList.map((image, index) => (
                    <div key={index} className="image-item">
                      <img src={image["data_url"]} alt="" width="100" />
                      <Flex gap="1">
                        <button onClick={() => onImageUpdate(index)}>
                          Aktualisieren
                        </button>
                        <button onClick={() => onImageRemove(index)}>
                          Entfernen
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

        <Flex direction="row" wrap="wrap" className="form-group mt-5 flex-col gap-2">
          <h2 className="text-sm font-bold">Zusätzliche Information</h2>
          <Flex direction="row" gap="5">
            <label htmlFor="part_time" className="text-sm font-medium w-32">
              Angebot
            </label>
            <Flex direction="column">
              <Flex direction="row" align="center" gap="1">
                <Checkbox {...register("part_time")} /> <label htmlFor="part_time" className="text-sm">Vollzeit</label>
              </Flex>
              <Flex direction="row" align="center" gap="1">
                <Checkbox {...register("full_time")} /> <label htmlFor="full_time" className="text-sm">Teilzeit</label>
              </Flex>
            </Flex>
          </Flex>
          <Flex direction="row" gap="5">
            <label htmlFor="training" className="text-sm font-medium w-32">
              Typ
            </label>
            <Flex direction="column">
              <Flex direction="row" align="center" gap="1">
                <Checkbox {...register("training")} /> <label htmlFor="training" className="text-sm">Ausbildung / Umschulung</label>
              </Flex>
              <Flex direction="row" align="center" gap="1">
                <Checkbox {...register("apprenticenship")} value="on" />
                <label htmlFor="apprenticenship" className="text-sm">Praktikum</label>
              </Flex>
            </Flex>
          </Flex>
        </Flex>
        <Flex direction="row" align="center" gap="5">
          <div className="text-sm w-32">Förderungsfähig nach <a className="text-lightGreen underline" rel="noreferrer" target="_blank" href="https://www.arbeitsagentur.de/karriere-und-weiterbildung/bildungsgutschein">AZAV</a>?</div>
          <Flex direction="row" align="center" gap="1">
            <Checkbox {...register("sponsonrship")} />
            <label htmlFor="sponsonrship" className="text-sm">Ja</label>
          </Flex>
        </Flex>
        {error && <p className="text-red-700">{error}</p>}
        <Button
          type="submit"
          className="h-10 !bg-rose-500 hover:!bg-rose-400"
          disabled={loading}
        >
          {loading ? <LoadingDots color="#ffffff" /> : "jetzt veröffentlichen"}
        </Button>
      </Flex>
    </form>
  )
}

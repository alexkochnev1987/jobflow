"use client"
import { Dialog, DialogContent, DialogTrigger } from "@/components/ui/dialog"
import l18n from "@/i18n/config"
import { schemaContactModal } from "@/lib/schemas"
import { yupResolver } from "@hookform/resolvers/yup"
import { Box, Button, Flex, Grid, TextArea } from "@radix-ui/themes"
import Image from "next/image"
import { useForm } from "react-hook-form"
import { Input } from "../shared/input"
import { useState } from "react"
import { LoadingDots } from "../shared/icons"

export default function ContactModal() {
  const [loading, setLoading] = useState(false)
  const [error, setError] = useState("")
  const {
    register,
    handleSubmit,
    formState: { errors },
  } = useForm({
    resolver: yupResolver(schemaContactModal),
  })

  const onSubmit = async (data) => {
    console.log("onSubmit", data)
    setLoading(true)

    try {
      const res = await fetch("/api/contact", {
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
    <Dialog>
      <DialogTrigger asChild>
        <div className="ml-5 mt-1 cursor-pointer self-start whitespace-nowrap text-sm leading-6 text-sky-500 max-md:ml-2.5">
          {l18n.t("Want it for free?")}
        </div>
      </DialogTrigger>
      <DialogContent className="text-black sm:max-w-[425px]">
        <form onSubmit={handleSubmit(onSubmit)}>
          <Flex className="text-black" direction="column" gap="2">
            <Grid columns="2" className="mb-4">
              <Image
                src="https://placehold.co/95x95"
                alt="sdsd"
                width={95}
                height={95}
                className="h-24 w-24 rounded-lg"
              />
              <Flex
                direction="row"
                width="2"
                gap="2"
                className="justify-center self-center align-middle"
              >
                <Image
                  src="https://placehold.co/40x40"
                  alt="sdsd"
                  width={40}
                  height={40}
                  className="m-1 h-10 w-10 rounded-full"
                />
                <Flex direction="column">
                  <p className="font-semibold text-black">Alice</p>
                  <p className="text-gray-500"> {l18n.t("Contact Person")}</p>
                </Flex>
              </Flex>
            </Grid>
            <label className="mb-1 text-sm font-medium leading-tight text-slate-700">
            {l18n.t("Full Name:")}
            </label>
            <Input
              {...register("name", { required: true })}
              className="my-1"
              placeholder="Name"
            />
            {errors.name && (
              <p className="text-red-700">{errors.name.message}</p>
            )}
            <label className="mb-1 text-sm font-medium leading-tight text-slate-700">
            {l18n.t("E-mail")}
            </label>
            <Input
              {...register("email", { required: true })}
              placeholder="E-mail"
              className="my-1"
            />
            {errors.email && (
              <p className="text-red-700">{errors.email.message}</p>
            )}
            <label className="mb-1 text-sm font-medium leading-tight text-slate-700">
            {l18n.t("Message")}
            </label>
            <TextArea
              {...register("message")}
              className="my-1 h-20"
              placeholder="Message"
              rows={3}
            />
            {errors.message && (
              <p className="text-red-700">{errors.message.message}</p>
            )}

            {error && <p className="text-red-700">{JSON.stringify(error)}</p>}
          </Flex>
          <Flex direction="column" gap="2">
            <p className="my-1 text-sm text-gray-500">
              By contacting this institution you agree to the Terms and
              Conditions
            </p>
            <Button
              type="submit"
              className="w-full !rounded-sm !bg-rose-500 !p-2 font-bold !text-white hover:!bg-rose-400"
            >
              {loading ? <LoadingDots color="#ffffff" /> : "Send"}
            </Button>
          </Flex>
        </form>
      </DialogContent>
    </Dialog>
  )
}

"use client"
import { Dialog, DialogContent, DialogTrigger } from "@/components/ui/dialog"
import l18n from "@/i18n/config"
import { schemaContactModal } from "@/lib/schemas"
import { yupResolver } from "@hookform/resolvers/yup"
import { Box, Button, Flex, Grid, TextArea } from "@radix-ui/themes"
import Image from "next/image"
import { useForm, useFormState } from "react-hook-form"
import { Input, Textarea } from "../shared/input"
import { useState } from "react"
import { LoadingDots } from "../shared/icons"
import Link from "next/link"
import { getImageFullUrl } from "@/lib/utils"

export default function ContactModal({ company }) {
  const [error, setError] = useState("")
  const {
    register,
    handleSubmit,
    formState: { errors, isSubmitting },
  } = useForm({
    resolver: yupResolver(schemaContactModal),
  })

  const contact = company?.Contact?.[0]
  console.log(company)
  const onSubmit = async (data) => {
    console.log("onSubmit", data)

    try {
      const res = await fetch("/api/contact", {
        method: "POST",
        body: JSON.stringify({
          ...data,
          contact_id: contact?.id,
          company_id: company?.id,
        }),
        headers: {
          "Content-Type": "application/json",
        },
      })

      if (!res.ok) {
        setError((await res.json()).message)
        return
      }
      alert("Message sent")
    } catch (error: any) {
      setError(error)
    }
  }
  return (
    <Dialog>
      <DialogTrigger asChild>
        <div className="ml-5 mt-1 cursor-pointer self-start whitespace-nowrap text-sm leading-6 text-sky-500 max-md:ml-2.5">
          {l18n.t("contact.modal.link", "Want it for free?")}
        </div>
      </DialogTrigger>
      <DialogContent className="text-black sm:max-w-[425px]">
        <form onSubmit={handleSubmit(onSubmit)}>
          <Flex className="text-black" direction="column" gap="2">
            <Flex>
              <Image
                src={getImageFullUrl(company?.logo)}
                alt="sdsd"
                width={95}
                height={95}
                className="mb-2 mr-5 h-24 w-24 rounded-lg"
              />
              <Flex
                direction="row"
                width="2"
                gap="2"
                className="justify-center self-center align-middle"
              >
                <Image
                  src={getImageFullUrl(contact?.avatar)}
                  alt="sdsd"
                  width={40}
                  height={40}
                  className="m-1 h-10 w-10 rounded-full"
                />
                <Flex direction="column">
                  <p className="font-semibold text-black">
                    {contact?.first_name} {contact?.last_name}
                  </p>
                  <p className="text-gray-500">
                    {" "}
                    {l18n.t("contact.modal.person", "Contact Person")}
                  </p>
                </Flex>
              </Flex>
            </Flex>
            <label className="mb-1 text-sm font-medium leading-tight text-slate-700">
              {l18n.t("contact.modal.name", "Name")}
            </label>
            <Input
              {...register("name", { required: true })}
              className="my-1"
              placeholder={l18n.t("contact.modal.name", "Name")}
            />
            {errors.name && (
              <p className="text-red-700">{errors.name.message}</p>
            )}
            <label className="my-2 text-sm font-medium leading-tight text-slate-700">
              {l18n.t("contact.modal.email", "E-mail")}
            </label>
            <Input
              {...register("email", { required: true })}
              placeholder={l18n.t("contact.modal.email", "Email")}
              className="my-1"
            />
            {errors.email && (
              <p className="text-red-700">{errors.email.message}</p>
            )}
            <label className="my-2 text-sm font-medium leading-tight text-slate-700">
              {l18n.t("contact.modal.message", "Message")}
            </label>
            <Textarea
              {...register("message")}
              className="my-1 h-20"
              placeholder={l18n.t("contact.modal.message", "Message")}
              rows={3}
            />
            {errors.message && (
              <p className="text-red-700">{errors.message.message}</p>
            )}

            {error && <p className="text-red-700">{JSON.stringify(error)}</p>}
          </Flex>
          <Flex direction="column" gap="2">
            <p className="my-2 text-sm text-gray-500">
              {l18n.t(
                "contact.modal.footer.text",
                " By contacting this institution you agree to the ",
              )}
              <Link href="/terms" className="text-sky-500">
                {l18n.t("contact.modal.footer.terms", "Terms and conditions")}
              </Link>
            </p>
            <Button
              type="submit"
              className="w-full !rounded-sm !bg-rose-500 !p-2 font-bold !text-white hover:!bg-rose-400"
            >
              {isSubmitting ? <LoadingDots color="#ffffff" /> : "Send"}
            </Button>
          </Flex>
        </form>
      </DialogContent>
    </Dialog>
  )
}

"use client"
import { Input } from "@/components/shared/input"
import { signIn } from "next-auth/react"
import { useState } from "react"
import { useForm } from "react-hook-form"
import { yupResolver } from "@hookform/resolvers/yup"
import * as yup from "yup"
import Cap from "@/icons/cap.svg"
import Building from "@/icons/building.svg"

import Button from "@/components/shared/button"
import { cn } from "@/lib/utils"

const schema = yup
  .object({
    business: yup.string().oneOf(["training", "company"]).required(),
    name: yup.string().required(),
    first_name: yup.string().required(),
    last_name: yup.string().required(),
    vat: yup.string().required(),
    city: yup.string().required(),
    street: yup.string().required(),
    country: yup.string().required(),
    zip: yup.string().required(),
    web: yup.string().url().required(),
    phone: yup.number().positive().integer().required(),
    email: yup.string().email().required(),
    email_requests: yup.string().email().required(),
    email_billing: yup.string().email().required(),
    password: yup.string().min(12).max(60).required(),
  })
  .required()

export const RegisterForm = () => {
  const [loading, setLoading] = useState(false)
  const [error, setError] = useState("")
  const {
    register,
    getValues,
    setValue,
    handleSubmit,
    watch,
    formState: { errors },
  } = useForm({ resolver: yupResolver(schema) })

  const { business } = getValues()

  watch("business")

  const isCompany = business === "company"
  const isTraining = business === "training"

  const onSubmit = async (data) => {
    console.log(data)
    setLoading(true)

    try {
      const res = await fetch("/api/register", {
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

      signIn(undefined, { callbackUrl: "/" })
    } catch (error: any) {
      setLoading(false)
      setError(error)
    }
  }

  return (
    <form onSubmit={handleSubmit(onSubmit)} className="mx-auto w-full max-w-md">
      {error && (
        <p className="mb-6 rounded bg-red-300 py-4 text-center">{error}</p>
      )}
      <h1 className="mb-5 text-xl font-bold leading-7">Business</h1>
      <input type="hidden" {...register("business")} />
      <div className="flex w-full flex-row gap-1">
        <div
          onClick={() => {
            setValue("business", "training")
          }}
          className={cn(
            "flex w-1/2 cursor-pointer flex-col justify-center rounded-md border border-gray-300 bg-white text-center align-middle text-gray-500",
            isTraining && "border-emerald-300 bg-slate-100 text-emerald-300",
          )}
        >
          <Cap
            className={cn(
              "mx-auto h-10 w-10 stroke-gray-500",
              isTraining && "stroke-emerald-300",
            )}
          />
          <p className="font-bold">Training Institute</p>
        </div>
        <div
          onClick={() => {
            setValue("business", "company")
          }}
          className={cn(
            "flex w-1/2 cursor-pointer flex-col justify-center rounded-md border border-gray-300 bg-white text-center align-middle text-gray-500",
            isCompany && "border-emerald-300 bg-slate-100 text-emerald-300",
          )}
        >
          <Building
            className={cn(
              "mx-auto h-10 w-10 stroke-gray-500",
              isCompany && "stroke-emerald-300",
            )}
          />
          <p className="font-bold">Company</p>
        </div>
      </div>
      <h1 className="my-5 text-xl font-bold leading-7">Company</h1>
      <div className="mb-6 flex flex-col gap-2">
        <Input {...register("name", { required: true })} placeholder="Name" />
        <Input
          {...register("vat", { required: true })}
          placeholder="Tax/VAT number"
        />
        <div className="flex flex-row gap-1">
          <Input
            {...register("street", { required: true })}
            placeholder="Street Address"
          />
          <Input
            {...register("zip", { required: true })}
            placeholder="Zip / Postal code"
          />
        </div>
        <Input {...register("city", { required: true })} placeholder="City" />
        <Input
          {...register("country", { required: true })}
          placeholder="Country"
        />
        <Input
          {...register("email_billing", { required: true })}
          placeholder="E-mail for billing"
        />
        <Input {...register("phone", { required: true })} placeholder="Phone" />
        <Input {...register("web", { required: true })} placeholder="Web" />
        <h1 className="my-5 text-xl font-bold leading-7">Contact Person</h1>
        <Input
          {...register("first_name", { required: true })}
          placeholder="First name"
        />
        <Input
          {...register("last_name", { required: true })}
          placeholder="Last name"
        />
        <Input
          {...register("email_requests", { required: true })}
          placeholder="E-mail for requests"
        />
        <h1 className="my-5 text-xl font-bold leading-7">Account</h1>
        <Input
          {...register("email", { required: true })}
          placeholder="E-mail"
        />
        <Input
          {...register("password", { required: true })}
          placeholder="Password"
          type="password"
        />
        <Button intent="primary" className="!bg-rose-500 hover:!bg-rose-400">
          Register
        </Button>
      </div>
    </form>
  )
}

"use client"
import { Input } from "@/components/shared/input"
import { signIn } from "next-auth/react"
import { useState } from "react"
import { useForm } from "react-hook-form"
import { yupResolver } from "@hookform/resolvers/yup"

import Cap from "@/icons/cap.svg"
import Building from "@/icons/building.svg"

import Button from "@/components/shared/button"
import { cn } from "@/lib/utils"
import { schemaCompanySignup } from "@/lib/schemas"
import { ROUTES } from "@/lib/constants"
import { p } from "@directus/sdk/dist/index-7ec1f729"

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
  } = useForm({ resolver: yupResolver(schemaCompanySignup) })

  const { business } = getValues()

  console.log(errors)
  watch("business")

  const isCompany = business === "company"
  const isTraining = business === "training"

  const onSubmit = async (data) => {
    console.log(data)
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
      signIn(undefined, { callbackUrl: ROUTES.DashBoard })
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
            "flex w-1/2 cursor-pointer flex-col justify-center rounded-md border border-gray-300 bg-white py-2 text-center align-middle text-gray-500",
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
      {errors.business && (
        <p className="text-red-700">{errors.business.message}</p>
      )}
      <h1 className="my-5 text-xl font-bold leading-7">Company</h1>
      <div className="mb-6 flex flex-col gap-2">
        <Input {...register("name", { required: true })} placeholder="Name" />
        {errors.name && <p className="text-red-700">{errors.name.message}</p>}
        <Input
          {...register("vat", { required: true })}
          placeholder="Tax/VAT number"
        />
        {errors.vat && <p className="text-red-700">{errors.vat.message}</p>}
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
        {errors.street && (
          <p className="text-red-700">{errors.street.message}</p>
        )}
        {errors.zip && <p className="text-red-700">{errors.zip.message}</p>}
        <Input {...register("city", { required: true })} placeholder="City" />
        {errors.city && <p className="text-red-700">{errors.city.message}</p>}
        <Input
          {...register("country", { required: true })}
          placeholder="Country"
        />
        {errors.country && (
          <p className="text-red-700">{errors.country.message}</p>
        )}
        <Input
          {...register("email_billing", { required: true })}
          placeholder="E-mail for billing"
        />
        {errors.email_billing && (
          <p className="text-red-700">{errors.email_billing.message}</p>
        )}
        <Input {...register("phone", { required: true })} placeholder="Phone" />
        {errors.phone && <p className="text-red-700">{errors.phone.message}</p>}
        <Input {...register("web", { required: true })} placeholder="Web" />
        {errors.web && <p className="text-red-700">{errors.web.message}</p>}
        <h1 className="my-5 text-xl font-bold leading-7">Contact Person</h1>
        <Input
          {...register("first_name", { required: true })}
          placeholder="First name"
        />
        {errors.first_name && (
          <p className="text-red-700">{errors.first_name.message}</p>
        )}
        <Input
          {...register("last_name", { required: true })}
          placeholder="Last name"
        />
        {errors.last_name && (
          <p className="text-red-700">{errors.last_name.message}</p>
        )}
        <Input
          {...register("email_requests", { required: true })}
          placeholder="E-mail for requests"
        />
        {errors.email_requests && (
          <p className="text-red-700">{errors.email_requests.message}</p>
        )}
        <h1 className="my-5 text-xl font-bold leading-7">Account</h1>
        <Input
          {...register("email", { required: true })}
          placeholder="E-mail"
        />
        {errors.email && <p className="text-red-700">{errors.email.message}</p>}
        <Input
          {...register("password", { required: true })}
          placeholder="Password"
          type="password"
        />
        {errors.password && (
          <p className="text-red-700">{errors.password.message}</p>
        )}
        {error && <p className="text-red-700">{error}</p>}
        <Button intent="primary" className="!bg-rose-500 hover:!bg-rose-400">
          Register
        </Button>
      </div>
    </form>
  )
}

"use client"
import { Input } from "@/components/shared/input"
import { signIn } from "next-auth/react"
import { useState } from "react"
import { useForm } from "react-hook-form"
import { yupResolver } from "@hookform/resolvers/yup"
import * as yup from "yup"

const schema = yup
  .object({
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
  const [signInClicked, setSignInClicked] = useState(false)
  const [error, setError] = useState("")
  const {
    register,
    handleSubmit,
    watch,
    formState: { errors },
  } = useForm({ resolver: yupResolver(schema) })

  console.log(watch("name"))

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
    <form onSubmit={handleSubmit(onSubmit)}>
      {error && (
        <p className="mb-6 rounded bg-red-300 py-4 text-center">{error}</p>
      )}
      <h1 className="text-2xl font-normal leading-7">Company</h1>
      <div className="mb-6 flex flex-col gap-2">
        <Input {...register("name", { required: true })} placeholder="Name" />
        <Input
          {...register("vat", { required: true })}
          placeholder="Tax/VAT number"
        />
        <Input
          {...register("street", { required: true })}
          placeholder="street address"
        />
        <Input
          {...register("zip", { required: true })}
          placeholder="zip / postal code"
        />
        <Input {...register("city", { required: true })} placeholder="city" />
        <Input
          {...register("country", { required: true })}
          placeholder="country"
        />
        <Input
          {...register("email_billing", { required: true })}
          placeholder="email for billing"
        />
        <Input {...register("phone", { required: true })} placeholder="phone" />
        <Input {...register("web", { required: true })} placeholder="web" />
        <h1 className="text-2xl font-normal leading-7">Contact Person</h1>
        <Input
          {...register("first_name", { required: true })}
          placeholder="first name"
        />
        <Input
          {...register("last_name", { required: true })}
          placeholder="last name"
        />
        <Input
          {...register("email_requests", { required: true })}
          placeholder="email for requests"
        />
        <h1 className="text-2xl font-normal leading-7">Account</h1>
        <Input {...register("email", { required: true })} placeholder="email" />
        <Input
          {...register("password", { required: true })}
          placeholder="Password"
          type="password"
        />
      </div>
    </form>
  )
}

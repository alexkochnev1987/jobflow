"use client"

import Button from "@/components/shared/button"
import { Google, LoadingDots } from "@/components/shared/icons"
import { Input } from "@/components/shared/input"
import { signIn } from "next-auth/react"
import { useState } from "react"
import { SubmitHandler, useForm } from "react-hook-form"
import { yupResolver } from "@hookform/resolvers/yup"
import * as yup from "yup"

const schema = yup
  .object({
    name: yup.string().required(),
    email: yup.string().email().required(),
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
      <h1 className="m-10 text-2xl font-normal leading-7">Konto erstellen</h1>
      <div className="mb-6 flex flex-col gap-2">
        <Input {...register("name", { required: true })} placeholder="Name" />
        <Input
          {...register("email", { required: true })}
          placeholder="Email address"
          type="email"
        />
        <Input
          {...register("password", { required: true })}
          placeholder="Password"
          type="password"
        />
      </div>
      <Button type="submit" intent="primary" size="medium">
        {loading ? "loading..." : "Anmelden"}
      </Button>
      <div className="my-4 flex items-center before:mt-0.5 before:flex-1 before:border-t before:border-gray-300 after:mt-0.5 after:flex-1 after:border-t after:border-gray-300">
        <p className="mx-4 mb-0 text-center font-semibold">OR</p>
      </div>

      <div className="flex flex-col space-y-4 text-white">
        <Button
          disabled={signInClicked}
          className={`flex h-10 w-full items-center justify-center space-x-3 rounded-md border transition-all duration-75 focus:outline-none`}
          onClick={() => {
            setSignInClicked(true)
            signIn("google")
          }}
        >
          {signInClicked ? (
            <LoadingDots color="#ffffff" />
          ) : (
            <>
              <Google className="h-5 w-5" />
              <p>Sign In with Google</p>
            </>
          )}
        </Button>
      </div>
    </form>
  )
}

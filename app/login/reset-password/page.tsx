"use client"
import { schemaChangePasswrd, schemaRequestResetPassword } from "@/lib/schemas"
import { redirect, useRouter, useSearchParams } from "next/navigation"
import { Suspense, useState } from "react"
import { useForm } from "react-hook-form"
import { Input } from "@/components/shared/input"
import Button from "@/components/shared/button"

import { yupResolver } from "@hookform/resolvers/yup"
import l18n from "@/i18n/config"
import { LoadingDots } from "@/components/shared/icons"

import { useToast } from "@chakra-ui/react"

export function RequestResetPassword() {
  const toast = useToast()
  const [error, setError] = useState("")
  const {
    register,
    handleSubmit,
    formState: { errors, isSubmitting },
  } = useForm({
    resolver: yupResolver(schemaRequestResetPassword),
  })

  const onSubmit = async (data) => {
    try {
      const res = await fetch("/api/forgot", {
        method: "POST",
        body: JSON.stringify(data),
        headers: {
          "Content-Type": "application/json",
        },
      })

      if (!res.ok) {
        setError((await res.json()).message)
        return
      }
      toast({
        title: "Password Reset",
        description: "Please check your inbox to reset your password.",
        status: "success",
        duration: 9000,
        isClosable: true,
      })
    } catch (error: any) {
      setError(error)
    }
  }

  return (
    <form
      onSubmit={handleSubmit(onSubmit)}
      className="mx-auto w-full max-w-md p-4 lg:p-0"
    >
      <div className="my-10 text-2xl font-bold leading-7">Reset Password</div>
      {error && (
        <p className="mb-6 rounded bg-red-300 py-4 text-center">{error}</p>
      )}
      <Input {...register("email", { required: true })} placeholder="E-mail" />
      {errors.email && <p className="text-red-700">{errors.email.message}</p>}

      <Button
        intent="primary"
        type="submit"
        className="rt-reset-button rt-reset-a rt-BaseButton rt-Button rt-r-size-4 rt-variant-solid mx-auto mb-20 w-full rounded-full !bg-magenta"
      >
        {isSubmitting ? <LoadingDots color="#ffffff" /> : "Submit"}
      </Button>
    </form>
  )
}

export function ChangePassword({ token }) {
  const toast = useToast()
  const router = useRouter()
  const [error, setError] = useState("")
  const {
    register,
    watch,
    handleSubmit,
    formState: { errors, isSubmitting },
  } = useForm({
    resolver: yupResolver(schemaChangePasswrd),
  })

  const onSubmit = async (data) => {
    console.log(data)

    try {
      const res = await fetch("/api/forgot", {
        method: "PUT",
        body: JSON.stringify({ ...data, token }),
        headers: {
          "Content-Type": "application/json",
        },
      })

      if (!res.ok) {
        setError((await res.json()).message)
        return
      }
      toast({
        title: "Password Reset",
        description: "Please login using your new password.",
        status: "success",
        duration: 9000,
        isClosable: true,
      })
      router.push("/login")
    } catch (error: any) {
      setError(error)
    }
  }

  return (
    <form
      onSubmit={handleSubmit(onSubmit)}
      className="mx-auto w-full max-w-md p-4 lg:p-0"
    >
      <div className="my-10 text-2xl font-bold leading-7">New Password</div>
      {error && (
        <p className="mb-6 rounded bg-red-300 py-4 text-center">{error}</p>
      )}
      <Input
        className="mb-4"
        type="password"
        placeholder={l18n.t("settings.delete.new-password", "New Password")}
        {...register("password", {
          required: true,
        })}
      />
      <Input
        {...register("password_confirmation", {
          required: true,
          validate: (val: string) => {
            if (watch("password") != val) {
              return l18n.t("settings.password.error", "Passwords do not match")
            }
          },
        })}
        type="password"
        placeholder={l18n.t("settings.password.confirm", "Confirm password")}
      />
      {errors.password_confirmation && (
        <p className="text-red-700">{errors.password_confirmation.message}</p>
      )}
      <Button
        intent="primary"
        type="submit"
        className="rt-reset-button rt-reset-a rt-BaseButton rt-Button rt-r-size-4 rt-variant-solid mx-auto mb-20 w-full rounded-full !bg-magenta"
      >
        {isSubmitting ? <LoadingDots color="#ffffff" /> : "Submit"}
      </Button>
    </form>
  )
}

function ResetPasswordContainer() {
  const searchParams = useSearchParams()

  const token = searchParams.get("token") || ""

  return (
    <>{token ? <ChangePassword token={token} /> : <RequestResetPassword />}</>
  )
}

export default function ResetPassword() {
  return (
    <Suspense>
      <ResetPasswordContainer />
    </Suspense>
  )
}

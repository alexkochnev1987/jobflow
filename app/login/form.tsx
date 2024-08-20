"use client"

// import Button from "@/components/shared/button"
import { Google, LoadingDots } from "@/components/shared/icons"
import { Input } from "@/components/shared/input"
import { ROUTES } from "@/lib/constants"
import { Button, Flex } from "@radix-ui/themes"
import { signIn } from "next-auth/react"
import { useSearchParams, useRouter } from "next/navigation"
import { ChangeEvent, useState } from "react"
import l18n from "@/i18n/config"
import Link from "next/link"

export const LoginForm = () => {
  const router = useRouter()
  const [loading, setLoading] = useState(false)
  const [formValues, setFormValues] = useState({
    email: "",
    password: "",
  })
  const searchParams = useSearchParams()
  const [error, setError] = useState(searchParams.get("error") || "")

  const callbackUrl = searchParams.get("callbackUrl") || ROUTES.DashBoard

  const onSubmit = async (e: React.FormEvent) => {
    e.preventDefault()
    try {
      setLoading(true)

      await signIn("credentials", {
        email: formValues.email,
        password: formValues.password,
        callbackUrl,
      })
      setFormValues({ email: "", password: "" })

      // router.push(callbackUrl)
      setLoading(false)
    } catch (error: any) {
      console.log(error)
      setLoading(false)
      setError(JSON.stringify(error))
    }
  }

  const handleChange = (event: ChangeEvent<HTMLInputElement>) => {
    const { name, value } = event.target
    setFormValues({ ...formValues, [name]: value })
  }

  function getFriendlyErrorMessage(error: string) {
    switch (error) {
      case "CredentialsSignin":
        return l18n.t(
          "login.error.CredentialsSignin",
          "Email oder Passwort ist falsch",
        )
      default:
        return error
    }
  }

  return (
    <form
      onSubmit={onSubmit}
      className="mx-10 flex w-full flex-col items-center justify-center"
    >
      <h1 className="my-10 text-2xl font-normal leading-7">
        {l18n.t("login.title", "Anmelden")}
      </h1>

      <div className=" flex w-full flex-col gap-2">
        <label className="text-sm">{l18n.t("login.email", "Email")}</label>
        <Input
          placeholder={l18n.t("login.email", "Email")}
          id="email"
          name="email"
          value={formValues.email}
          onChange={handleChange}
          className="border-1 border-darkGray bg-lightGray placeholder:text-darkGray"
        />
        <label className="text-sm">
          {l18n.t("login.password", "Password")}
        </label>
        <Input
          required
          type="password"
          name="password"
          value={formValues.password}
          onChange={handleChange}
          placeholder={l18n.t("login.password", "Password")}
          className="border-1 border-darkGray bg-lightGray placeholder:text-darkGray"
        />
      </div>

      {error && (
        <p className="mb-6 rounded py-4 text-center font-extrabold text-red-800">
          {getFriendlyErrorMessage(error)}
        </p>
      )}
      <Flex justify="start" align="start" width="100%">
        <Link href="/login/reset-password" className="text-left">
          Reset password
        </Link>
      </Flex>
      <Button
        type="submit"
        variant="solid"
        size="4"
        className="mx-auto mt-2 w-full rounded-full !bg-magenta"
      >
        {loading ? (
          <LoadingDots color="#ffffff" />
        ) : (
          l18n.t("login.button", "einloggen")
        )}
      </Button>
    </form>
  )
}

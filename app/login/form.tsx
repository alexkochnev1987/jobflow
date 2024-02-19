"use client"

// import Button from "@/components/shared/button"
import { Google, LoadingDots } from "@/components/shared/icons"
import { Input } from "@/components/shared/input"
import { ROUTES } from "@/lib/constants"
import { Button } from "@radix-ui/themes"
import { signIn } from "next-auth/react"
import { useSearchParams, useRouter } from "next/navigation"
import { ChangeEvent, useState } from "react"
import l18n from "@/i18n/config"

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
      setFormValues({ email: "", password: "" })

      console.log("callbackUrl", callbackUrl)
      await signIn("credentials", {
        email: formValues.email,
        password: formValues.password,
        callbackUrl,
      })

      router.push(callbackUrl)
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
    <form onSubmit={onSubmit} className="w-full">
      <h1 className="my-10 text-2xl font-normal leading-7">
        {l18n.t("login.title", "Anmelden")}
      </h1>

      <div className="mb-6 flex flex-col gap-2">
        <label className="text-sm">{l18n.t("login.email", "Email")}</label>
        <Input
          placeholder={l18n.t("login.email", "Email")}
          id="email"
          name="email"
          value={formValues.email}
          onChange={handleChange}
          className="bg-lightGray border-1 border-darkGray placeholder:text-darkGray"
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
          className="bg-lightGray border-1 border-darkGray placeholder:text-darkGray"
        />
      </div>

      {error && (
        <p className="mb-6 rounded py-4 text-center font-extrabold text-red-800">
          {getFriendlyErrorMessage(error)}
        </p>
      )}
      <Button
        type="submit"
        variant="solid"
        size="4"
        className="mx-auto w-full rounded-full !bg-magenta"
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

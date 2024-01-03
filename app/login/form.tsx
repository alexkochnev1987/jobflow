"use client"

// import Button from "@/components/shared/button"
import { Google, LoadingDots } from "@/components/shared/icons"
import { Input } from "@/components/shared/input"
import { ROUTES } from "@/lib/constants"
import { cn } from "@/lib/utils"
import { Button } from "@radix-ui/themes"
import { signIn } from "next-auth/react"
import { useSearchParams, useRouter } from "next/navigation"
import { ChangeEvent, useState } from "react"
import l18n from "../../i18n/config"

export const LoginForm = () => {
  const router = useRouter()
  const [signInClicked, setSignInClicked] = useState(false)
  const [loading, setLoading] = useState(false)
  const [formValues, setFormValues] = useState({
    email: "",
    password: "",
  })
  const [error, setError] = useState("")

  const searchParams = useSearchParams()
  const callbackUrl = searchParams.get("callbackUrl") || ROUTES.DashBoard

  const onSubmit = async (e: React.FormEvent) => {
    e.preventDefault()
    try {
      setLoading(true)
      setFormValues({ email: "", password: "" })

      const res = await signIn("credentials", {
        redirect: false,
        email: formValues.email,
        password: formValues.password,
        callbackUrl,
      })

      setLoading(false)

      console.log(res)
      if (res?.ok) {
        router.push(callbackUrl)
      } else {
        setError("invalid email or password")
      }
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

  const input_style = ""

  return (
    <form onSubmit={onSubmit}>
      {error && (
        <p className="mb-6 rounded bg-red-300 py-4 text-center">{error}</p>
      )}
      <h1 className="m-10 text-2xl font-normal leading-7">
        {l18n.t("Konto erstellen")}
      </h1>
      <div className="mb-6 flex flex-col gap-2">
        <Input
          placeholder={l18n.t("Email")}
          id="email"
          name="email"
          value={formValues.email}
          onChange={handleChange}
          className={cn(input_style)}
        />
        <Input
          required
          type="password"
          name="password"
          value={formValues.password}
          onChange={handleChange}
          placeholder={l18n.t("Password")}
          className={cn(input_style)}
        />
      </div>
      <Button type="submit" variant="solid" size="4" className="mx-auto w-full">
        {loading ? <LoadingDots color="#ffffff" /> : l18n.t("Anmelden")}
      </Button>

      {/* <div className="my-4 flex items-center before:mt-0.5 before:flex-1 before:border-t before:border-gray-300 after:mt-0.5 after:flex-1 after:border-t after:border-gray-300">
        <p className="mx-4 mb-0 text-center font-bold">OR</p>
      </div> */}
      {/* 
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
      </div> */}
    </form>
  )
}

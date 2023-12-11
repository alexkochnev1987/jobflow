"use client"

import Button from "@/components/shared/button"
import { Google, LoadingDots } from "@/components/shared/icons"
import { Input } from "@/components/shared/input"
import { signIn } from "next-auth/react"
import { ChangeEvent, useState } from "react"

export const RegisterForm = () => {
  const [loading, setLoading] = useState(false)
  const [signInClicked, setSignInClicked] = useState(false)
  const [formValues, setFormValues] = useState({
    name: "",
    email: "",
    password: "",
  })
  const [error, setError] = useState("")

  const onSubmit = async (e: React.FormEvent) => {
    e.preventDefault()
    setLoading(true)
    setFormValues({ name: "", email: "", password: "" })

    try {
      const res = await fetch("/api/register", {
        method: "POST",
        body: JSON.stringify(formValues),
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

  const handleChange = (event: ChangeEvent<HTMLInputElement>) => {
    const { name, value } = event.target
    setFormValues({ ...formValues, [name]: value })
  }

  return (
    <form onSubmit={onSubmit}>
      {error && (
        <p className="mb-6 rounded bg-red-300 py-4 text-center">{error}</p>
      )}
      <h1 className="m-10 text-2xl font-normal leading-7">Konto erstellen</h1>
      <div className="mb-6 flex flex-col gap-2">
        <Input
          required
          type="name"
          name="name"
          value={formValues.name}
          onChange={handleChange}
          placeholder="Name"
        />
        <Input
          required
          type="email"
          name="email"
          value={formValues.email}
          onChange={handleChange}
          placeholder="Email address"
        />
        <Input
          required
          type="password"
          name="password"
          value={formValues.password}
          onChange={handleChange}
          placeholder="Password"
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

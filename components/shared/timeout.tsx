"use client"
import { Button, Callout } from "@radix-ui/themes"
import { useEffect, useState } from "react"
import { useSignInModal } from "../layout/sign-in-modal"
import { Info } from "lucide-react"

export default function Timeout({ defaultSeconds }) {
  const { SignInModal, setShowSignInModal } = useSignInModal()
  const [seconds, setSeconds] = useState(defaultSeconds)

  useEffect(() => {
    // This function will run when the component mounts
    const intervalId = setInterval(() => {
      setSeconds((prevSeconds) => prevSeconds - 1)
    }, 1000) // Update every 1000ms (1 second)

    return () => {
      clearInterval(intervalId)
    }
  }, [])

  // Format the seconds into minutes and seconds
  const minutes = Math.floor(seconds / 60)
  const remainingSeconds = seconds % 60

  // Add leading zeros to minutes and seconds if needed
  const formattedMinutes = minutes < 10 ? `0${minutes}` : minutes
  const formattedSeconds =
    remainingSeconds < 10 ? `0${remainingSeconds}` : remainingSeconds
  return (
    <Callout.Root size="3" variant="outline">
      <SignInModal />
      <Callout.Icon>
        <Info />
      </Callout.Icon>
      <div className="flex flex-col gap-3">
        <h2 className="flex text-lg font-bold">
          Save Your Results: Register now!
        </h2>
        <span>
          Your responses and career details are preserved for the next 15
          minutes. Register now to safeguard your results from expiration.
        </span>
        <span className="flex text-2xl font-bold">
          {formattedMinutes}:{formattedSeconds}
        </span>
        <Button
          size="3"
          variant="outline"
          className="w-50 self-end"
          onClick={() => setShowSignInModal(true)}
        >
          Ergebnisse speichern
        </Button>
      </div>
    </Callout.Root>
  )
}

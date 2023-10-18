"use client"
import { Button, Callout } from "@radix-ui/themes"
import { useEffect, useState } from "react"
import { Info } from "lucide-react"
import Link from "next/link"

export default function Timeout({ defaultSeconds }) {
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
    <Callout.Root
      size="3"
      variant="outline"
      className="border-l-2 border-[#A7C5FD] bg-[#F1F6FD]"
    >
      <Callout.Icon>
        <Info color="#0052EA" />
      </Callout.Icon>
      <div className="flex flex-col gap-3">
        <h2 className="flex text-lg font-bold">Testergebnisse gespeichert</h2>
        <span>
          Deine Antworten und dein Berufe sind für die nächsten 15 Minuten
          gespeichert. Wenn du dich weder registrierst noch einen Premium-Report
          kaufst, verfällt dein Ergebnis.
        </span>
        {remainingSeconds > 0 && (
          <>
            <span className="flex text-2xl font-bold">
              {formattedMinutes}:{formattedSeconds}
            </span>
            <Link href="/register" className="w-50 self-end">
              <Button
                size="3"
                variant="outline"
                className="!border-[#181818] !text-[#181818]"
              >
                Ergebnisse speichern
              </Button>
            </Link>
          </>
        )}
      </div>
    </Callout.Root>
  )
}

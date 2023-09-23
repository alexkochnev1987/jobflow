"use client"
import { Button, Callout } from "@radix-ui/themes"
import { InfoIcon } from "lucide-react"

export default function Timeout() {
  return (
    <Callout.Root size="3" variant="outline">
      <Callout.Icon>
        <InfoIcon />
      </Callout.Icon>
      <div className="flex flex-col gap-3">
        <h2 className="flex text-lg font-bold">Testergebnisse gespeichert</h2>
        <span>
          Deine Antworten und dein Berufe sind für die nächsten 15 Minuten
          gespeichert. Wenn du dich weder registrierst noch einen Premium-Report
          kaufst, verfällt dein Ergebnis.
        </span>
        <span className="flex text-2xl font-bold">14 : 55 : 55</span>
        <Button size="3" variant="outline" className="w-50 self-end">
          Ergebnisse speichern
        </Button>
      </div>
    </Callout.Root>
  )
}

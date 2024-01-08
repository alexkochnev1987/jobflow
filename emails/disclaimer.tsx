import {
  Body,
  Button,
  Container,
  Head,
  Hr,
  Html,
  Link,
  Preview,
  Section,
  Text,
} from "jsx-email"
import * as React from "react"
import { disclaimer } from "./styles"


export default function Disclaimer() {
  return (
    <>
      <Text style={disclaimer}>
        Deine Daten werden ausschließlich für die Auswertung verwendet und nicht
        mit Dritten geteilt. Du hast jederzeit das Recht, deine Daten zu
        löschen. Weitere Informationen dazu findest Du in unserer
        Datenschutzerklärung. Standardgemäß erstellen wir keine Rechnungen für
        private Endkunden. Sollte jedoch eine Rechnung erforderlich sein,
        kontaktieren Sie bitte ebenfalls den Support.
      </Text>
      <Text style={disclaimer}>
        Shift Your Career | Hasenhöhe 5 | 22587 Hamburg | 01575 485 9337 |
        marcel@shiftyourcareer.de | Vertretungsberechtigte Person: Marcel
        Reperich | Haftungshinweis: Trotz sorgfältiger inhaltlicher Kontrolle
        übernehmen wir keine Haftung für die Inhalte externer Links. Für den
        Inhalt der verlinkten Seiten sind ausschließlich deren Betreiber
        verantwortlich.
      </Text>
    </>
  )
}

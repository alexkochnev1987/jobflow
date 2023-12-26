"use client"

import React from "react"
import { loadStripe } from "@stripe/stripe-js"
import Button from "../shared/button"

const stripePromise = loadStripe(process.env.NEXT_PUBLIC_STRIPE_PUBLISHABLE_KEY)

export default function PaymentButton() {
  React.useEffect(() => {
    // Check to see if this is a redirect back from Checkout
    const query = new URLSearchParams(window.location.search)
    if (query.get("success")) {
      console.log("Order placed! You will receive an email confirmation.")
    }

    if (query.get("canceled")) {
      console.log(
        "Order canceled -- continue to shop around and checkout when you’re ready.",
      )
    }
  }, [])
  return (
    <form action="/api/checkout" method="POST">
      <Button
        type="submit"
        className="text-bold m-auto max-w-sm rounded-full bg-rose-500 text-lg leading-snug text-white hover:bg-rose-600"
      >
        Ergebnis sichern
      </Button>
    </form>
  )
}

"use client"

import React from "react"
import { loadStripe } from "@stripe/stripe-js"
import Button from "../shared/button"
import { userStore } from "@/app/client/store"
import { cn } from "@/lib/utils"

const stripePromise = loadStripe(process.env.NEXT_PUBLIC_STRIPE_PUBLISHABLE_KEY)

export default function PaymentButton({ className }) {
  const { id } = userStore()
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
      <input type="hidden" name="uid" value={id} />
      <Button type="submit" className={cn(className)}>
        Ergebnis sichern
      </Button>
    </form>
  )
}

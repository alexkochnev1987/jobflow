"use client"

import React from "react"
import { loadStripe } from "@stripe/stripe-js"
import { userStore } from "@/app/client/store"
import { cn } from "@/lib/utils"
import { Button } from "@radix-ui/themes"

const stripePromise = loadStripe(process.env.NEXT_PUBLIC_STRIPE_PUBLISHABLE_KEY)

export default function PaymentButton({}) {
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
    <form action={`/api/checkout?uid=${id}`} method="POST">
      <Button type="submit" size="4" variant="solid" className="mt-10 w-full">
        Ergebnis sichern
      </Button>
    </form>
  )
}

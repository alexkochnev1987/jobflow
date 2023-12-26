import { sendEmail } from "@/lib/email"
import { NextRequest, NextResponse } from "next/server"
import Stripe from "stripe"
import { createUser } from "@/app/actions/user"
import PaymentFailedEmail from "emails/payment-failed-email"
import WelcomeEmail from "emails/welcome-email"
import { componentToHTML } from "@/lib/utils"


// This is your test secret API key.
const stripe = new Stripe(process.env.STRIPE_SECRET_KEY)

const endpointSecret =
  process.env.STRIPE_WEBHOOK_SECRET ||
  "whsec_c5aebea467ccda0b5085d0e23562989ff64441b6e0b95ea0cfbbebda3902d430"

export async function POST(req: NextRequest) {
  const body = await req.text()
  const sig = req.headers.get("stripe-signature") as string | string[]

  let event

  try {
    event = stripe.webhooks.constructEvent(body, sig, endpointSecret)
  } catch (err) {
    return new NextResponse(
      JSON.stringify({
        status: "error",
        message: err.message,
      }),
      { status: 500 },
    )
  }

  // Handle the checkout.session.completed event
  switch (event.type) {
    case "checkout.session.completed": {
      const { payment_status, customer_details } = event.data.object

      if (payment_status !== "paid") {
        break
      }

      const { name, email } = customer_details

      const password = Math.random().toString(36).slice(-8)
      await createUser(name, email, password)

      await sendEmail({
        to: email,
        subject: "Welcome to Shift Your Career",
        html: await componentToHTML(
          WelcomeEmail({
            username: email,
            password,
          }),
        ),
      })
      break
    }
    case "checkout.session.async_payment_failed": {
      const { customer_email } = event.data.object
      await sendEmail({
        to: customer_email,
        subject: "Payment failed",
        html: await componentToHTML(PaymentFailedEmail()),
      })
      break
    }
    default:
      console.log(`Unhandled event type ${event.type}`)
      break
  }

  return new NextResponse(JSON.stringify(event))
}

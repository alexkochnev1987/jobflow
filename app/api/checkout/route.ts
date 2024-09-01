import { ROUTES } from "@/lib/constants"
import { NextRequest, NextResponse } from "next/server"
import Stripe from "stripe"

if (!process.env.STRIPE_SECRET_KEY) {
  throw new Error("Missing STRIPE_SECRET_KEY in environment variables.")
}
// This is your test secret API key.
const stripe = new Stripe(process.env.STRIPE_SECRET_KEY)

export async function POST(req: NextRequest) {
  console.log(req.nextUrl)
  // https or http
  const uid = req.nextUrl.searchParams.get("uid")

  try {
    const session = await stripe.checkout.sessions.create({
      line_items: [
        {
          // Provide the exact Price ID (for example, pr_1234) of the product you want to sell
          price: process.env.STRIPE_LINE_ITEM,
          quantity: 1,
        },
      ],
      mode: "payment",
      metadata: {
        uid,
      },
      success_url: `${process.env.NEXTAUTH_URL}${ROUTES.Payment}?success=true`,
      cancel_url: `${process.env.NEXTAUTH_URL}${ROUTES.EvaluationResults}?canceled=true`,
    })
    console.log("Session", session.url)

    if (!session?.url) throw new Error("No session url")
    // redirect to checkout
    return NextResponse.redirect(session.url, 303)
  } catch (error) {
    return new NextResponse(
      JSON.stringify({
        status: "error",
        message: error,
      }),
      { status: 500 },
    )
  }
}

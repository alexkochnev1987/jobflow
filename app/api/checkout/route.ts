import { ROUTES } from "@/lib/constants"
import { NextRequest, NextResponse } from "next/server"
import Stripe from "stripe"

// This is your test secret API key.
const stripe = new Stripe(process.env.STRIPE_SECRET_KEY)

export async function POST(req: NextRequest) {
  console.log(req.nextUrl)
  // https or http
  const formData = await req.formData()

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
        uid: formData.get("uid").toString(),
      },
      success_url: `${req.nextUrl.origin}${ROUTES.Login}?success=true`,
      cancel_url: `${req.nextUrl.origin}${ROUTES.EvaluationResults}?canceled=true`,
    })

    // redirect to checkout
    return NextResponse.redirect(session.url, 303)
  } catch (error) {
    return new NextResponse(
      JSON.stringify({
        status: "error",
        message: error.message,
      }),
      { status: 500 },
    )
  }
}

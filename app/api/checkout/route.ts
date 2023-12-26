import { NextRequest, NextResponse } from "next/server"
import Stripe from "stripe"

// This is your test secret API key.
const stripe = new Stripe(process.env.STRIPE_SECRET_KEY)

export async function POST(req: NextRequest) {
  const formData = await req.formData()

  try {
    const session = await stripe.checkout.sessions.create({
      line_items: [
        {
          // Provide the exact Price ID (for example, pr_1234) of the product you want to sell
          price: "price_1ORfWrG0SAwjll4VcTkb9b72",
          quantity: 1,
        },
      ],
      mode: "payment",
      metadata: {
        uid: formData.get("uid").toString(),
      },
      success_url: `http://localhost:3000/payment?success=true`,
      cancel_url: `http://localhost:3000/test/results?canceled=true`,
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

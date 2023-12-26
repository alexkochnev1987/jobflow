import { createUser } from "@/app/actions/user"
import prisma from "@/lib/prisma"
import { NextRequest, NextResponse } from "next/server"

export async function POST(req: NextRequest) {
  try {
    const { name, email, password } = (await req.json()) as {
      name: string
      email: string
      password: string
    }

    const user = await createUser(name, email, password)

    return NextResponse.json({
      user: {
        name: user.name,
        email: user.email,
      },
    })
  } catch (error: any) {
    console.log(error)
    return new NextResponse(
      JSON.stringify({
        status: "error",
        message: error.message,
      }),
      { status: 500 },
    )
  }
}

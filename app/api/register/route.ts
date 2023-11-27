import { hash } from "bcryptjs"
import prisma from "@/lib/prisma"
import { v4 as uuid } from "uuid"
import { NextRequest, NextResponse } from "next/server"

export async function POST(req: NextRequest) {
  try {
    const { name, email, password } = (await req.json()) as {
      name: string
      email: string
      password: string
    }
    const hashed_password = await hash(password, 12)

    const user = await prisma.user.create({
      data: {
        id: uuid(),
        updatedAt: new Date(),
        name,
        email: email.toLowerCase(),
        password: hashed_password,
      },
    })

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

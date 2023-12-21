import { hash } from "bcryptjs"
import prisma from "@/lib/prisma"
import { NextRequest, NextResponse } from "next/server"
import { InferType } from "yup"
import { schemaCompanySignup, schemaNewCourse } from "@/lib/schemas"
import { uploadFiles } from "@directus/sdk"
import directus from "@/lib/directus"
import { getServerSession } from "next-auth"
import { authOptions } from "../auth/[...nextauth]/route"
import { getUserCompanyById } from "@/app/actions/user"

export async function POST(req: NextRequest) {
  try {
    const json = await req.json()
    const session = await getServerSession(authOptions)

    const user = await prisma?.user.findFirst({
      where: {
        email: session?.user?.email,
      },
    })

    const company = await getUserCompanyById(user.id)

    const data: InferType<typeof schemaNewCourse> =
      await schemaNewCourse.validate(json)

    const courseType = []

    if (data.apprenticenship === "on") {
      courseType.push("apprenticenship")
    }
    if (data.training === "on") {
      courseType.push("training")
    }

    const pace = []
    if (data.part_time === "on") {
      pace.push("part_time")
    }
    if (data.full_time === "on") {
      pace.push("full_time")
    }

    const formData = new FormData()

    const blob = await fetch(data.image).then((r) => r.blob())
    formData.append("title", data.name)
    formData.append("image", blob, data.name.replace(/\.[^/.]+$/, ""))

    const directusImage = await directus.request(uploadFiles(formData))

    const course = await prisma.courses.create({
      data: {
        name: data.name,
        description: data.description,
        price: data.price,
        sponsonrship: data.sponsonrship === "on",
        start_date: data.start_date,
        location: data.location,
        course_type: JSON.stringify(courseType),
        pace: JSON.stringify(pace),
        image: directusImage.id,
        company: company.id,
      },
    })

    return NextResponse.json({
      ...course,
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

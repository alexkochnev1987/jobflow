import prisma from "@/lib/prisma"
import { NextRequest, NextResponse } from "next/server"
import { InferType } from "yup"
import { schemaNewCourse } from "@/lib/schemas"
import { uploadFiles } from "@directus/sdk"
import directus, { uploadFormData } from "@/lib/directus"
import { getUserCompanyById } from "@/app/actions/user"
import { auth } from "auth"

export async function DELETE(req: NextRequest) {
  try {
    const id = req.url.split("=")[1]

    const course = await prisma.courses.update({
      where: {
        id: parseInt(id.toString(), 10),
      },
      data: {
        status: "draft",
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

export async function POST(req: NextRequest) {
  try {
    const json = await req.json()
    const session = await auth()

    const user = await prisma?.user.findFirst({
      where: {
        email: session?.user?.email,
      },
    })

    if (!user) throw new Error("User not found")

    const company = await getUserCompanyById(user.id)

    if (!company) throw new Error("Company not found")

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
      pace.push("part-time")
    }
    if (data.full_time === "on") {
      pace.push("full-time")
    }

    const payload = {
      name: data.name,
      description: data.description,
      price: data.price,
      sponsonrship: data.sponsonrship === "on",
      start_date: data.start_date,
      location: data.location,
      course_type: courseType,
      pace: pace,
      company: company.id,
      image: data.image,
      status: "published",
    }

    if (data.image && data.image.length > 36) {
      const formData = new FormData()

      const blob = await fetch(data.image).then((r) => r.blob())
      formData.append("title", data.name)
      formData.append("image", blob, data.name.replace(/\.[^/.]+$/, ""))

      const directusImage = await uploadFormData(formData)

      // @ts-ignore
      payload.image = directusImage.id
    }

    const course = data.id
      ? await prisma.courses.upsert({
        where: {
          id: data.id,
        },
        update: payload,
        create: payload,
      })
      : await prisma.courses.create({
        data: payload,
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

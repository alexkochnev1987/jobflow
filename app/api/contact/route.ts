import { sendEmail } from "@/lib/email"
import { schemaContactModal } from "@/lib/schemas"
import { componentToHTML } from "@/lib/utils"
import { auth } from "auth"
import ContactCourseEmail from "emails/contact-course-email"
import { NextRequest, NextResponse } from "next/server"
import { InferType } from "yup"

export async function POST(req: NextRequest) {
  try {
    const json = await req.json()
    

    const data: InferType<typeof schemaContactModal> =
      await schemaContactModal.validate(json)

    const contact = await prisma?.contact.findFirst({
      where: {
        id: data.contact_id,
      },
    })


    await sendEmail({
      to: contact.email,
      subject: "User wants to connect!",
      html: await componentToHTML(
        ContactCourseEmail({
          name: data.name,
          message: data.message,
          email: data.email,
        }),
      ),
    })

    console.log("email sent")

    return NextResponse.json({
      status: "success",
      message: "Email sent!",
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
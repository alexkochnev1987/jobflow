import { hash } from "bcryptjs"
import prisma from "@/lib/prisma"
import { NextRequest, NextResponse } from "next/server"
import { InferType } from "yup"
import { schemaCompanySignup } from "@/lib/schemas"

export async function POST(req: NextRequest) {
  // create company
  // create contact
  // create user
  try {
    const json = await req.json()
    const data: InferType<typeof schemaCompanySignup> =
      await schemaCompanySignup.validate(json)

    const hashed_password = await hash(data.password, 12)

    const user = await prisma.user.create({
      data: {
        name: data.name,
        email: data.email.toLowerCase(),
        password: hashed_password,
      },
    })

    const company = await prisma.companies.create({
      data: {
        name: data.name,
        vat: data.vat,
        web: data.web,
        email_billing: data.email_billing.toLowerCase(),
        type: data.business,
      },
    })

    const contact = await prisma.contact.create({
      data: {
        first_name: data.first_name,
        last_name: data.last_name,
        email: data.email_requests.toLowerCase(),
        phone: data.phone,
        userId: user.id,
        company_id: company.id,
      },
    })

    const address = await prisma.address.create({
      data: {
        city: data.city,
        street: data.street,
        country: data.country,
        zip: data.zip,
        company_id: company.id,
      },
    })

    return NextResponse.json({
      company: company.id,
      user: user.id,
      address: address.id,
      contact: contact.id,
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

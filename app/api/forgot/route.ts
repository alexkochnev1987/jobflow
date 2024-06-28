import { sendEmail } from "@/lib/email";
import { componentToHTML } from "@/lib/utils";
import jwt from "jsonwebtoken";
import { NextRequest, NextResponse } from "next/server";
import { Template as ResetPasswordEmail } from "@/emails/forgot-password-email"
import { hash } from "bcryptjs";
import prisma from "lib/prisma";

export async function POST(req: NextRequest) {
  const { email } = await req.json();

  console.log("Email", email);
  const secret = process.env.JWT_SECRET;

  const user = await prisma.user.findUnique({
    where: {
      email: email as string,
    },
  })

  console.log("User", user);

  if (!user) {
    return new NextResponse(JSON.stringify({
      status: 200,
      body: {
        message: 'Ok',
      },
    }));
  }

  const token = jwt.sign({ email }, secret, {
    expiresIn: "1h",
  });

  // send email
  await sendEmail({
    to: email,
    subject:
      "Reset password request",
    html: await componentToHTML(
      ResetPasswordEmail({
        token,
      }),
    ),
  })

  return new NextResponse(JSON.stringify({
    status: 200,
    body: {
      message: 'Ok',
    },
  }));
}

function verifyToken(token: string): Promise<string> {
  return new Promise((resolve, reject) => {
    jwt.verify(token, process.env.JWT_SECRET, (err, decoded) => {
      if (err) {
        return reject(err);
      }
      return resolve(decoded.email);
    });
  })
}

export async function PUT(req: NextRequest) {
  const { token, password } = await req.json();

  console.log("Token", token);

  const email = await verifyToken(token);

  const hashed_password = await hash(password, 12)

  await prisma.user.update({
    where: {
      email: email as string,
    },
    data: {
      password: hashed_password as string,
    },
  });

  return new NextResponse(JSON.stringify({
    status: 200,
    body: {
      message: 'Ok',
    },
  }));
}
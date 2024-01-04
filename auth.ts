import { config } from "auth.config"
import NextAuth from "next-auth"
import prisma from "lib/prisma"
import { ROUTES } from "./lib/constants"
import { PrismaAdapter } from "@auth/prisma-adapter"
export const { handlers, auth, signIn, signOut } = NextAuth({
  adapter: PrismaAdapter(prisma),
  pages: {
    signIn: ROUTES.Login,
  },
  session: {
    strategy: "jwt",
  },
  ...config,
})

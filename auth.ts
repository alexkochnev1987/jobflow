import { config } from "auth.config"
import NextAuth from "next-auth"
import { PrismaAdapter } from "@next-auth/prisma-adapter"
import prisma from "lib/prisma"
import { ROUTES } from "./lib/constants"
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

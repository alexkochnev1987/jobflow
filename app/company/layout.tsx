"use server"
import Link from "next/link"
import Logo from "@/icons/logo.svg"

export default async function DashboardLayout({
  children, // will be a page or nested layout
}: {
  children: React.ReactNode
}) {
  return (
    <div className="w-full ">
      <div className={`flex w-full justify-center bg-white/0`}>
        <div className="mx-5 flex h-16 w-full max-w-screen-xl items-center justify-center">
          <Link href="/" className="flex items-center font-display text-xl">
            <Logo />
          </Link>
        </div>
      </div>
      <main className="flex min-h-screen min-w-full pt-30 md:pt-20">{children}</main>
    </div>
  )
}

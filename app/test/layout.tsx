"use server"

import Header from "./header"

export default async function DashboardLayout({
  children, // will be a page or nested layout
}: {
  children: React.ReactNode
}) {
  return (
    <div>
      <Header />
      <main className="flex min-h-screen w-full">{children}</main>
    </div>
  )
}

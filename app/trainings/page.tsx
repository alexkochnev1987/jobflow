"use server"
import CompanyCourses from "./courses"
import { getUserByEmail, getUserCompanyById } from "@/app/actions/user"
import { getCoursesByCompanyId } from "@/app/actions/courses"
import { redirect } from "next/navigation"
import { ROUTES } from "@/lib/constants"
import { auth } from "auth"

export default async function Page() {
  const session = await auth()
  if (!session?.user) {
    return redirect(ROUTES.Login)
  }
  const user = await getUserByEmail(session.user.email)
  const company = await getUserCompanyById(user.id)
  const courses = await getCoursesByCompanyId(company.id)

  console.log(courses)
  return <CompanyCourses courses={courses} />
}

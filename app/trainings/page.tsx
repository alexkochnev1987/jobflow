"use server"
import { getServerSession } from "next-auth"
import CompanyCourses from "./courses"
import { getUserByEmail, getUserCompanyById } from "@/app/actions/user"
import { getCoursesByCompanyId } from "@/app/actions/courses"

export default async function Page() {
  const session = await getServerSession()
  const user = await getUserByEmail(session.user.email)
  const company = await getUserCompanyById(user.id)
  const courses = await getCoursesByCompanyId(company.id)

  console.log(courses)
  return <CompanyCourses courses={courses} />
}

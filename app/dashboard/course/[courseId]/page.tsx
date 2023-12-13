'use client'
import CourseCarousel from "@/components/dashboard/course-carousel"
import TestsCarousel from "@/components/dashboard/test-carousel"
import BackIcon from "@/icons/back.svg"
import ChevronMore from "@/icons/ChevronMore.svg"
import Clock from "@/icons/clock.svg"
import Calendar from "@/icons/calendar.svg"
import Location from "@/icons/location.svg"
import Currency from "@/icons/currency.svg"
import courses from "@/test/mocks/courses.json"
import tests from "@/test/mocks/tests.json"
import Image from "next/image"
import { Badge } from "@radix-ui/themes"
import { Info } from "lucide-react"
import { useRouter } from "next/navigation"

function JobListing(props) {
  return (
    <div className="flex flex-col items-start self-stretch bg-white py-6">
      <div className="w-[423px] max-w-full">
        <div className="flex gap-5 max-md:flex-col max-md:items-stretch max-md:gap-0">
          <div className="flex w-[48%] flex-col items-stretch max-md:ml-0 max-md:w-full">
            <Image
              height={193}
              width={193}
              src="https://placehold.co/193x193"
              placeholder="empty"
              alt=""
            />
          </div>
          <div className="ml-5 flex  flex-col items-stretch max-md:ml-0 max-md:w-full">
            <div className="my-auto flex flex-col px-5 py-0.5 max-md:mt-10">
              <Badge color="green" radius="full" className="w-24">
                90% Match <Info className="w-4" />
              </Badge>
              <div className="mt-3 text-lg font-bold leading-7 text-black">
                Web Development
              </div>
              <div className="mt-4 flex items-center justify-between gap-2 pr-2.5">
                <Currency className="fill-slate-700" />
                <div className="grow self-stretch whitespace-nowrap text-sm leading-5 text-slate-700">
                  <span className="font-semibold">Salary:</span>{" "}
                  <span className="font-normal">37.000 - 65.000 €</span>
                </div>
              </div>
              <div className="mt-1.5 flex items-center justify-between gap-2 pr-2">
                <Clock className="fill-slate-700" />
                <div className="grow self-stretch whitespace-nowrap text-sm leading-5 text-slate-700">
                  <span className="font-semibold">Pace: </span>{" "}
                  <span>Part-Time, Full-Time</span>
                </div>
              </div>
              <div className="mt-1.5 flex items-center justify-between gap-2">
                <Location />
                <div className="grow self-stretch whitespace-nowrap text-sm leading-6 text-slate-700">
                  <span className="font-semibold">Format:</span>{" "}
                  <span className="">Online, On Campus</span>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div className="mt-6 w-full self-stretch text-sm leading-6 text-black max-md:max-w-full">
        The main task of a UX designer is to create a user-friendly product by
        researching user needs, designing intuitive interfaces, and conducting
        usability testing to refine the user experience. They prioritize user
        satisfaction, accessibility, and aesthetics, collaborating with
        cross-functional teams to achieve these goals through an iterative
        design process. Ultimately, their goal is to deliver a product that
        meets both user expectations and business objectives.
      </div>
      <div className="mt-6 flex items-center gap-0 self-end px-5">
        <div className="my-auto grow whitespace-nowrap text-sm font-medium text-emerald-300">
          Show details
        </div>
        <ChevronMore />
      </div>
    </div>
  )
}

export default function Page({ params }: { params: { courseId: string } }) {
  const router = useRouter()

  function goBack() {
    router.back()
  }
  return (
    <div>
      <h1
        className="flex flex-row items-center text-xl font-bold cursor-pointer"
        onClick={goBack}
      >
        <BackIcon /> Results
      </h1>
      <div>
        <JobListing />
      </div>
      <TestsCarousel tests={tests} />
      <CourseCarousel courses={courses} />
    </div>
  )
}

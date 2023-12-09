import React from "react"
import Logo from "@/components/shared/icons/logo.svg"

function FooterComponent() {
  return (
    <footer className="mx-auto  flex  max-w-6xl flex-col items-stretch border-t border-solid border-t-[color:var(--grey-300,#D0D5DD)] bg-white px-20 py-12 max-md:px-5">
      <div className="mt-3.5 max-md:max-w-full max-md:pr-5">
        <div className="flex gap-5 max-md:flex-col max-md:items-stretch max-md:gap-0">
          <div className="flex w-[18%] flex-col items-stretch max-md:ml-0 max-md:w-full">
            <div className="flex grow flex-col items-stretch pb-12 max-md:mt-8">
              <div className="text-base font-semibold leading-5 text-black">
                {" "}
                Media{" "}
              </div>
              <div className="mt-4 whitespace-nowrap text-base leading-6 text-gray-500">
                {" "}
                Stories{" "}
              </div>
              <div className="mt-3 whitespace-nowrap text-base leading-6 text-gray-500">
                {" "}
                Affiliate{" "}
              </div>
              <div className="mb-9 mt-3 whitespace-nowrap text-base leading-6 text-gray-500">
                {" "}
                Press{" "}
              </div>
            </div>
          </div>
          <div className="ml-5 flex w-[82%] flex-col items-stretch max-md:ml-0 max-md:w-full">
            <div className="max-md:mt-8 max-md:max-w-full">
              <div className="flex gap-5 max-md:flex-col max-md:items-stretch max-md:gap-0">
                <div className="flex w-3/12 flex-col items-stretch max-md:ml-0 max-md:w-full">
                  <div className="flex flex-col items-stretch max-md:mt-3.5">
                    <div className="text-base font-semibold leading-5 text-black">
                      {" "}
                      Support{" "}
                    </div>
                    <div className="mt-4 whitespace-nowrap text-base leading-6 text-gray-500">
                      {" "}
                      Institutes{" "}
                    </div>
                    <div className="mt-3 whitespace-nowrap text-base leading-6 text-gray-500">
                      {" "}
                      Blog{" "}
                    </div>
                    <div className="mt-3 whitespace-nowrap text-base leading-6 text-gray-500">
                      {" "}
                      FAQ{" "}
                    </div>
                  </div>
                </div>
                <div className="ml-5 flex w-3/12 flex-col items-stretch max-md:ml-0 max-md:w-full">
                  <div className="flex grow flex-col items-stretch pb-9 max-md:mt-3.5">
                    <div className="text-base font-semibold leading-5 text-black">
                      {" "}
                      About{" "}
                    </div>
                    <div className="mt-4 whitespace-nowrap text-base leading-6 text-gray-500">
                      {" "}
                      Our Team{" "}
                    </div>
                    <div className="mt-3 whitespace-nowrap text-base leading-6 text-gray-500">
                      {" "}
                      Companies{" "}
                    </div>
                    <div className="mt-3 whitespace-nowrap text-base leading-6 text-gray-500">
                      {" "}
                      Philosophy{" "}
                    </div>
                  </div>
                </div>
                <div className="ml-5 flex w-3/12 flex-col items-stretch max-md:ml-0 max-md:w-full">
                  <div className="flex flex-col items-stretch max-md:mt-3.5">
                    <div className="text-base font-semibold leading-5 text-black">
                      {" "}
                      Social{" "}
                    </div>
                    <div className="mt-4 whitespace-nowrap text-base leading-6 text-gray-500">
                      {" "}
                      Twitter{" "}
                    </div>
                    <div className="mt-3 whitespace-nowrap text-base leading-6 text-gray-500">
                      {" "}
                      LinkedIn{" "}
                    </div>
                    <div className="mt-3 whitespace-nowrap text-base leading-6 text-gray-500">
                      {" "}
                      Facebook{" "}
                    </div>
                  </div>
                </div>
                <div className="ml-5 flex w-3/12 flex-col items-stretch max-md:ml-0 max-md:w-full">
                  <div className="flex grow flex-col items-stretch max-md:mt-3.5">
                    <div className="text-base font-semibold leading-5 text-black">
                      {" "}
                      Legal{" "}
                    </div>
                    <div className="mt-4 whitespace-nowrap text-base leading-6 text-gray-500">
                      {" "}
                      Terms{" "}
                    </div>
                    <div className="mt-3 whitespace-nowrap text-base leading-6 text-gray-500">
                      {" "}
                      Privacy{" "}
                    </div>
                    <div className="mt-3 whitespace-nowrap text-base leading-6 text-gray-500">
                      {" "}
                      Data Protection{" "}
                    </div>
                    <div className="mt-3 whitespace-nowrap text-base leading-6 text-gray-500">
                      {" "}
                      Contact{" "}
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div className="mt-10 flex flex-col  max-md:max-w-full max-md:px-5">
        <div className="mt-6 flex  justify-start gap-5 max-md:max-w-full max-md:flex-wrap">
          <Logo />
          <div className="my-auto grow self-center whitespace-nowrap text-base leading-6 text-gray-400">
            © 2023 Laborflow. All rights reserved.
          </div>
        </div>
      </div>
    </footer>
  )
}

export default FooterComponent

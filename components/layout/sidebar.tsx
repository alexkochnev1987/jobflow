import React, { ButtonHTMLAttributes, ReactElement } from "react"
import { cn } from "@/lib/utils"
import Lab from "@/components/shared/icons/lab.svg"
import Book from "@/components/shared/icons/book.svg"
import Cap from "@/components/shared/icons/cap.svg"
import Premium from "@/components/shared/icons/premium.svg"
import TextDocument from "@/components/shared/icons/text-document.svg"

export type Props = React.InputHTMLAttributes<HTMLDivElement>

const Sidebar = ({ children, className }: Props): ReactElement => {
  return (
    <div className={cn(`flex w-1/5 flex-col gap-4`, className)}>{children}</div>
  )
}

export const SidebarItem = ({
  children,
}: ButtonHTMLAttributes<HTMLButtonElement>) => (
  <button className="flex justify-start rounded-sm stroke-slate-700 stroke-[1.5] px-2 py-2 text-base font-medium text-slate-700 hover:bg-sky-100 hover:stroke-sky-500 hover:stroke-2 hover:text-sky-500">
    {children}
  </button>
)

export const DashBoardSidebar = (): ReactElement => {
  return (
    <Sidebar>
      <SidebarItem>
        <Lab width="24" height="24" />
        <span className="pl-3">Career Lab</span>
      </SidebarItem>
      <SidebarItem>
        <Book width="24" height="24" />
        <span className="pl-3">Trainings</span>
      </SidebarItem>
      <SidebarItem>
        <Cap width="24" height="24" />
        <span className="pl-3 pr-1">Scholarships</span>
        <Premium width="24" height="24" />
      </SidebarItem>
      <SidebarItem>
        <TextDocument width="24" height="24" />
        <span className="pl-3 pr-1">Applications</span>
        <Premium width="24" height="24" />
      </SidebarItem>
    </Sidebar>
  )
}
export default DashBoardSidebar

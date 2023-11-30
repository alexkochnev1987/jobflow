import type { Meta, StoryObj } from "@storybook/react"
import { DashBoardSidebar } from "./sidebar"

// More on how to set up stories at: https://storybook.js.org/docs/writing-stories#default-export
const meta = {
  title: "SideBar",
  component: DashBoardSidebar,
  parameters: {
    // More on how to position stories at: https://storybook.js.org/docs/configure/story-layout
    layout: "fullscreen",
  },
} satisfies Meta<typeof DashBoardSidebar>

export default meta

type Story = StoryObj<typeof meta>

// More on writing stories with args: https://storybook.js.org/docs/writing-stories/args
export const UserSidebar: Story = {}



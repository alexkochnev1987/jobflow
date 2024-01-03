import type { Meta, StoryObj } from "@storybook/react"
import NavBar from "./navbar"

// More on how to set up stories at: https://storybook.js.org/docs/writing-stories#default-export
const meta = {
  title: "NavBar",
  component: NavBar,
  parameters: {
    // More on how to position stories at: https://storybook.js.org/docs/configure/story-layout
    layout: "fullscreen",
  },
} satisfies Meta<typeof NavBar>

export default meta

type Story = StoryObj<typeof meta>

// More on writing stories with args: https://storybook.js.org/docs/writing-stories/args
export const NonLoggedIn: Story = {}

export const LoggedIn: Story = {
  args: {
    session: {
      user: {
        email: "test@test.com",
        image: "",
        name: "Test User",
        id: "1",
      },
      expires: "",
    },
  },
}

import type { Meta, StoryObj } from "@storybook/react"
import CareerGrid from "./career-grid"
import careers from "@/test/mocks/careers.json"

// More on how to set up stories at: https://storybook.js.org/docs/writing-stories#default-export
const meta = {
  title: "CareerCard",
  component: CareerGrid,
  parameters: {
    // More on how to position stories at: https://storybook.js.org/docs/configure/story-layout
    layout: "centered",
  },
  args: {
    careers,
  },
} satisfies Meta<typeof CareerGrid>

export default meta

type Story = StoryObj<typeof meta>

// More on writing stories with args: https://storybook.js.org/docs/writing-stories/args
export const Grid: Story = {}

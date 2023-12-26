import type { Meta, StoryObj } from "@storybook/react"
import CareerCard from "./career-card"
import careers from "@/test/mocks/careers.json"

const career = careers[0]
// More on how to set up stories at: https://storybook.js.org/docs/writing-stories#default-export
const meta = {
  title: "Career Cards",
  component: CareerCard,
  parameters: {
    // More on how to position stories at: https://storybook.js.org/docs/configure/story-layout
    layout: "centered",
  },
  args: {
    isLoading: false,
  },
} satisfies Meta<typeof CareerCard>

export default meta

type Story = StoryObj<typeof meta>

// More on writing stories with args: https://storybook.js.org/docs/writing-stories/args
export const CareerCardDefault: Story = {}
export const CareerCardLoading: Story = {
  args: {
    isLoading: true,
  },
}


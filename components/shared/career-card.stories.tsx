import type { Meta, StoryObj } from "@storybook/react"
import CareerCard from "./career-card"

// More on how to set up stories at: https://storybook.js.org/docs/writing-stories#default-export
const meta = {
  title: "CareerCard",
  component: CareerCard,
  parameters: {
    // More on how to position stories at: https://storybook.js.org/docs/configure/story-layout
    layout: "centered",
  },
  args: {
    isLoading: false,
    data: {
      career: "Software Developer",
      rating: 90,
    },
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
export const CareerCardYellowMatch: Story = {
  args: {
    data: {
      rating: 70,
      career: "Software Developer",
    }
  },
}

export const CareerCardRedMatch: Story = {
  args: {
    data: {
      rating: 30,
      career: "Software Developer",
    }
  },
}

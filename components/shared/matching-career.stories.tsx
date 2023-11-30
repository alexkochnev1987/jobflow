import type { Meta, StoryObj } from "@storybook/react"

import MatchingCareerCard from "./matching-career"


// More on how to set up stories at: https://storybook.js.org/docs/writing-stories#default-export
const meta = {
  title: "MatchingCareerCard",
  component: MatchingCareerCard,
  parameters: {
    // More on how to position stories at: https://storybook.js.org/docs/configure/story-layout
    layout: "centered",
  },
  argTypes: {
    hidden: {
      control: {
        type: "boolean",
      },
    },
    id: {
      control: {
        type: "number",
      },
    },
    career: {
      control: {
        type: "object",
      },
    },
  },
  args: {
    id: 1,
    hidden: false,
    career: {
      rating: 100,
      data: {
        name: "Software Engineer",
        salaryMin: 2000,
        salaryMax: 3000,
        retrainingWeeks: 12,
      },
    },
  },
} satisfies Meta<typeof MatchingCareerCard>

export default meta

type Story = StoryObj<typeof meta>

// More on writing stories with args: https://storybook.js.org/docs/writing-stories/args
export const MatchingCareerCardHidden: Story = {
}

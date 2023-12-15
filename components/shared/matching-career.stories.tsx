import type { Meta, StoryObj } from "@storybook/react"

import MatchingCareerCard from "./matching-career"
import careers from "@/test/mocks/careers.json"

const career = careers[0]

// More on how to set up stories at: https://storybook.js.org/docs/writing-stories#default-export
const meta = {
  title: "Test Results",
  component: MatchingCareerCard,
  parameters: {
    // More on how to position stories at: https://storybook.js.org/docs/configure/story-layout
    layout: "fullscreen",
  },
  decorators: [
    (Story) => (
      <div className="flex flex-col items-center justify-center min-h-screen max-w-5xl m-auto">
        <Story />
      </div>
    ),
  ],
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
      rating: career.rating,
      data: {
        name: career.name,
        salaryMin: career.salaryMin,
        salaryMax: career.salaryMax,
        retrainingWeeks: career.retrainingWeeks,
        description: career.description,
      },
    },
  },
} satisfies Meta<typeof MatchingCareerCard>

export default meta

type Story = StoryObj<typeof meta>

// More on writing stories with args: https://storybook.js.org/docs/writing-stories/args
export const MatchingCareerCardShow: Story = {
  args: {
    hidden: false,
  },
}

export const MatchingCareerCardHidden: Story = {
  args: {
    hidden: true,
  },
}

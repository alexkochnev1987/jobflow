import type { Meta, StoryObj } from "@storybook/react"

import MatchingCareerCard from "./matching-career"

// More on how to set up stories at: https://storybook.js.org/docs/writing-stories#default-export
const meta = {
  title: "MatchingCareerCard",
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
      rating: 100,
      data: {
        name: "Software Engineer",
        salaryMin: 2000,
        salaryMax: 3000,
        retrainingWeeks: 12,
        description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
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

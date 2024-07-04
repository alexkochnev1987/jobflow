import type { Meta, StoryObj } from "@storybook/react"
import tests from "@/test/mocks/tests.json"
import TestCard, { Test } from "./test-card"

// More on how to set up stories at: https://storybook.js.org/docs/writing-stories#default-export
const meta = {
  title: "Tests",
  component: TestCard,
  parameters: {
    // More on how to position stories at: https://storybook.js.org/docs/configure/story-layout
    layout: "centered",
  },
  args: {
    ...tests[0],
    isLoading: false,
    type: ''
  },
} satisfies Meta<typeof TestCard>

export default meta

type Story = StoryObj<typeof meta>

// More on writing stories with args: https://storybook.js.org/docs/writing-stories/args
export const CardDefault: Story = {
  
}
export const CardLoading: Story = {
  args: {
    ...tests[0],
    isLoading: true,
  },
}

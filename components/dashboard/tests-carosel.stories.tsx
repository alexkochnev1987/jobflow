import type { Meta, StoryObj } from "@storybook/react"
import tests from "@/test/mocks/tests.json"
import TestsCarousel from "./test-carousel"

// More on how to set up stories at: https://storybook.js.org/docs/writing-stories#default-export
const meta = {
  title: "Tests",
  component: TestsCarousel,
  parameters: {
    // More on how to position stories at: https://storybook.js.org/docs/configure/story-layout
    layout: "centered",
  },
  args: {
    tests,
  },
} satisfies Meta<typeof TestsCarousel>

export default meta

type Story = StoryObj<typeof meta>

// More on writing stories with args: https://storybook.js.org/docs/writing-stories/args
export const Carousel: Story = {}

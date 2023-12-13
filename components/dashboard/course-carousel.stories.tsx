import type { Meta, StoryObj } from "@storybook/react"
import CareerGrid from "./career-grid"
import courses from "@/test/mocks/courses.json"
import CourseCarousel from "./course-carousel"

// More on how to set up stories at: https://storybook.js.org/docs/writing-stories#default-export
const meta = {
  title: "Courses",
  component: CourseCarousel,
  parameters: {
    // More on how to position stories at: https://storybook.js.org/docs/configure/story-layout
    layout: "centered",
  },
  args: {
    courses,
  },
} satisfies Meta<typeof CourseCarousel>

export default meta

type Story = StoryObj<typeof meta>

// More on writing stories with args: https://storybook.js.org/docs/writing-stories/args
export const Carousel: Story = {}

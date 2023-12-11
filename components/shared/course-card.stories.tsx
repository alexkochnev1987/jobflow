import type { Meta, StoryObj } from "@storybook/react"
import CourseCard from "./course-card"
import courses from "@/test/mocks/courses.json"

// More on how to set up stories at: https://storybook.js.org/docs/writing-stories#default-export
const meta = {
  title: "Courses",
  component: CourseCard,
  parameters: {
    // More on how to position stories at: https://storybook.js.org/docs/configure/story-layout
    layout: "centered",
  },
  args: courses[0],
} satisfies Meta<typeof CourseCard>

export default meta

type Story = StoryObj<typeof meta>

// More on writing stories with args: https://storybook.js.org/docs/writing-stories/args
export const CourseCardDefault: Story = {}
export const CourseCardLoading: Story = {
  args: {
    ...courses[0],
    isLoading: true,
  },
}

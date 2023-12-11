import { styled } from "react-cva"

export default styled("button")("my-4 w-full rounded-lg p-2 text-center normal-case leading-loose", {
  variants: {
    intent: {
      primary: [
        "bg-sky-500",
        "border-sky-500",
        "text-white",
        "border-transparent",
        "hover:bg-sky-400",
      ],
      secondary: [
        "bg-gray-100",
        "text-gray-800",
        "border-gray-400",
        "hover:bg-gray-200",
      ],
      outlined: [
        "bg-white",
        "text-black",
        "hover:bg-gray-200",
        "border border-black",
      ]
    },
    size: {
      small: ["text-sm", "py-1", "px-2"],
      medium: ["text-base", "py-2", "px-4"],
    },
  },
  compoundVariants: [{ intent: "primary", size: "medium", class: "uppercase" }],
  defaultVariants: {
    intent: "primary",
    size: "medium",
  },
})

import type { Preview } from "@storybook/react"
import "@radix-ui/themes/styles.css"
import "../app/globals.css"
import "../app/theme-config.css"
const preview: Preview = {
  parameters: {
    actions: { argTypesRegex: "^on[A-Z].*" },
    controls: {
      matchers: {
        color: /(background|color)$/i,
        date: /Date$/i,
      },
    },
  },
}

export default preview

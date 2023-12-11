import React from "react"
import type { Preview } from "@storybook/react"
import { Theme } from "@radix-ui/themes"
import "react-loading-skeleton/dist/skeleton.css"
import "../app/globals.css"
import "../app/theme-config.css"
import "../node_modules/@radix-ui/themes/styles.css"


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
  decorators: [
    (Story) => React.createElement(
      Theme,
      null,
      React.createElement(Story)
    ),
  ],
}



export default preview

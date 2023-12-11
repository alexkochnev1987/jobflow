import type { StorybookConfig } from "@storybook/nextjs"

const config: StorybookConfig = {
  stories: [
    "../stories/**/*.mdx",
    "../stories/**/*.stories.@(js|jsx|mjs|ts|tsx)",
    "../components/**/**/*.stories.@(js|jsx|mjs|ts|tsx)",
    "../app/**/**/*.stories.@(js|jsx|mjs|ts|tsx)",
  ],
  addons: [
    "@storybook/addon-links",
    "@storybook/addon-essentials",
    "@storybook/addon-onboarding",
    "@storybook/addon-interactions",
    "@storybook/addon-styling",
    "@storybook/addon-a11y",
  ],
  framework: {
    name: "@storybook/nextjs",
    options: {},
  },
  docs: {
    autodocs: "tag",
  },
  webpackFinal: (webpackConfig) => {
    // This modifies the existing image rule to exclude `.svg` files
    // since we handle those with `@svgr/webpack`.
    //@ts-ignore
    const imageRule = webpackConfig.module.rules.find((rule) => {
      //@ts-ignore
      if (typeof rule !== "string" && rule.test instanceof RegExp) {
        //@ts-ignore
        return rule.test.test(".svg")
      }
    })
    if (typeof imageRule !== "string") {
      //@ts-ignore
      imageRule.exclude = /\.svg$/
    }
    //@ts-ignore
    webpackConfig.module.rules.push({
      test: /\.svg$/,
      use: ["@svgr/webpack"],
    })

    return webpackConfig
  },
}
export default config

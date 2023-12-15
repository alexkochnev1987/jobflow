/** @type {import('next').NextConfig} */
const nextConfig = {
  reactStrictMode: false,
  swcMinify: true,
  experimental: {
    serverActions: true,
  },
  images: {
    dangerouslyAllowSVG: true,
    remotePatterns: [
      {
        hostname: "placehold.co",
      },
    ],
    domains: [
      "localhost",
      "app.shiftyourcareer.de",
    ],
  },
  i18n: {
    locales: ["de"],
    defaultLocale: "de",
  },
  async redirects() {
    return [
      // {
      //   source: "/github",
      //   destination: "https://github.com/steven-tey/precedent",
      //   permanent: false,
      // },
    ]
  },
  webpack(webpackConfig) {
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

module.exports = nextConfig

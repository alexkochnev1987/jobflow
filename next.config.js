/** @type {import('next').NextConfig} */
const nextConfig = {
  compiler: {
    removeConsole: process.env.NODE_ENV === "production"
  },
  reactStrictMode: false,
  swcMinify: true,
  experimental: {
    serverActions: {
      dev: true,
      // This is the default value
      check: true,
    }
  },
  images: {
    dangerouslyAllowSVG: true,
    remotePatterns: [
      {
        protocol: "https",
        hostname: "placehold.co",
        pathname: "/**",
      },
      {
        protocol: "https",
        hostname: "directus.quereinstieg.com",
        pathname: "/**",
      },
    ],
    domains: [
      "localhost",
      "placehold.co",
      "app.quereinstieg.com",
      "directus.quereinstieg.com",
    ],
  },
  i18n: {
    locales: ["de"],
    defaultLocale: "de",
  },
  transpilePackages: ["lucide-react"],
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
    // Fixes npm packages that depend on `fs` module
    webpackConfig.resolve.fallback = { fs: false };
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

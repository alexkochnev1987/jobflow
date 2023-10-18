import { SSTConfig } from "sst"
import { NextjsSite, Service } from "sst/constructs"

export default {
  config(_input) {
    return {
      name: "jobflow",
      region: "eu-central-1",
    }
  },
  stacks(app) {
    app.stack(function Site({ stack }) {
      const strapi = new Service(stack, "strapi", {
        path: "./strapi",
        port: 1337,
        cpu: "0.25 vCPU",
        memory: "0.5 GB",
        // environment: {
        //   DATABASE_CLIENT: process.env.DATABASE_CLIENT,
        //   DATABASE_HOST: process.env.DATABASE_HOST,
        //   DATABASE_PORT: process.env.DATABASE_PORT,
        //   DATABASE_NAME: process.env.DATABASE_NAME,
        //   DATABASE_USERNAME: process.env.DATABASE_USERNAME,
        //   DATABASE_PASSWORD: process.env.DATABASE_PASSWORD,
        // },
      })
      const site = new NextjsSite(stack, "site", {
        timeout: 120,
        runtime: "nodejs18.x",
      })

      stack.addOutputs({
        SiteUrl: site.url,
        Service: strapi.id,
      })
    })
  },
} satisfies SSTConfig

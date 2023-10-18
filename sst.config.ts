import { SSTConfig } from "sst"
import { NextjsSite, Service } from "sst/constructs"

export default {
  config(_input) {
    return {
      name: "jobflow",
      region: "eu-central-1",
      stage: "jobflow",
    }
  },
  stacks(app) {
    app.stack(function Site({ stack }) {
      // const strapi = new Service(stack, "strapi", {
      //   path: "./strapi",
      //   port: 1337,
      //   cpu: "0.25 vCPU",
      //   memory: "0.5 GB",
      // })
      const site = new NextjsSite(stack, "site", {
        timeout: 60,
        runtime: "nodejs18.x",
      })

      stack.addOutputs({
        SiteUrl: site.url,
        // Service: strapi.url,
      })
    })
  },
} satisfies SSTConfig

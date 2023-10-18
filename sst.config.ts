import { SSTConfig } from "sst"
import { NextjsSite } from "sst/constructs"

export default {
  config(_input) {
    return {
      name: "jobflow",
      region: "eu-central-1",
    }
  },
  stacks(app) {
    app.stack(function Site({ stack }) {
      const site = new NextjsSite(stack, "site", {
        timeout: 120,
        runtime: "nodejs18.x",
      })

      stack.addOutputs({
        SiteUrl: site.url,
      })
    })
  },
} satisfies SSTConfig

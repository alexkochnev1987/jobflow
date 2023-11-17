import i18n from "i18next"
import Backend from "i18next-fs-backend"

i18n.use(Backend).init({
  fallbackLng: "de",
  lng: "de",
  resources: {
    de: {
      translations: require("./locales/de/translations.json"),
    },
  },
  ns: ["translations"],

  defaultNS: "translations",
})

i18n.languages = ["de"]

export default i18n.t

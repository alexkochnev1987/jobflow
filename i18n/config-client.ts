import i18n from "i18next"
import { initReactI18next } from "react-i18next"

i18n.use(initReactI18next).init({
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

export default i18n
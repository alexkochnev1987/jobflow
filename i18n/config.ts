import i18n from "i18next"
import detector from "i18next-browser-languagedetector"
import backend from "i18next-http-backend"

i18n
  .use(detector)
  // .use(fsBackend)
  .use(backend)
  // .use(initReactI18next) // passes i18n down to react-i18next
  .init({
    backend: {
      // http backend options
      loadPath: '/api/locales?lng={{lng}}&ns={{ns}}',
      addPath: '/api/locales?lng={{lng}}&ns={{ns}}',
    },
    lng: "de",
    resources: {
      de: {
        translations: require("./locales/de/translations.json"),
      },
    },
    ns: ["translations"],

    defaultNS: "translations",
    fallbackLng: "de", // use en if detected lng is not available
    saveMissing: true, // send not translated keys to endpoint
  })

export default i18n

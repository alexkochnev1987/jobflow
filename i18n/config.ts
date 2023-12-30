import i18n from "i18next"
import detector from "i18next-browser-languagedetector"
import backend from "i18next-http-backend"
import chained from "i18next-chained-backend"
import fsBacked from "i18next-fs-backend"

// .use(fsBackend)
i18n
  .use(detector)
  .use(chained)
  // .use(initReactI18next) // passes i18n down to react-i18next
  .init({
    backend: {
      backends: [fsBacked, backend],
      // http backend options
      backendOptions: [
        {
          loadPath: "./locales/de/translations.json",
          addPath: "./locales/de/translations.json",
        },
        {
          addPath: "/api/locales?lng={{lng}}&ns={{ns}}",
          loadPath: "/locales/de/translations.json",
        },
      ],
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

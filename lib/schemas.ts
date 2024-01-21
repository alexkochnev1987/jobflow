import * as yup from "yup"
import l18n from "@/i18n/config"

export const schemaContactModal = yup
  .object({
    name: yup.string().required(l18n.t("schemaContactModal.name.required")),
    email: yup.string().email().required(l18n.t("schemaContactModal.email.required")),
    message: yup.string().required(l18n.t("schemaContactModal.message.required")),
    contact_id: yup.number().typeError(l18n.t("schemaContactModal.contact_id.typeError")),
    company_id: yup.number().typeError(l18n.t("schemaContactModal.company_id.typeError")),
  })
  .required()

export const schemaChangePasswrd = yup
  .object({
    password: yup.string().required(l18n.t("schemaChangePasswrd.password.required")).min(12, l18n.t("schemaChangePasswrd.password.min")).max(60, l18n.t("schemaChangePasswrd.password.max")),
    password_confirmation: yup.string().required(l18n.t("schemaChangePasswrd.password_confirmation.required")).min(12, l18n.t("schemaChangePasswrd.password_confirmation.min")).max(60, l18n.t("schemaChangePasswrd.password_confirmation.max")),
  })
  .required()
export const schemaCompanySignup = yup
  .object({
    business: yup.string().oneOf(["training", "company"]).required(l18n.t("schemaCompanySignup.business.required")),
    name: yup.string().required(l18n.t("schemaCompanySignup.business.required")),
    first_name: yup.string().required(l18n.t("schemaCompanySignup.business.required")),
    last_name: yup.string().required(l18n.t("schemaCompanySignup.business.required")),
    vat: yup.string(),
    city: yup.string().required(l18n.t("schemaCompanySignup.city.required")),
    street: yup.string().required(l18n.t("schemaCompanySignup.street.required")),
    country: yup.string().required(l18n.t("schemaCompanySignup.country.required")),
    zip: yup.string().required(l18n.t("schemaCompanySignup.zip.required")),
    web: yup.string().url().required(l18n.t("schemaCompanySignup.web.required")),
    phone: yup.string().required(l18n.t("schemaCompanySignup.phone.required")),
    email: yup.string().email().required(l18n.t("schemaCompanySignup.email.required")),
    email_requests: yup.string().email().required(l18n.t("schemaCompanySignup.email_requests.required")),
    email_billing: yup.string().email().required(l18n.t("schemaCompanySignup.email_billing.required")),
    password: yup.string().min(12, l18n.t("schemaCompanySignup.password.min")).max(60, l18n.t("schemaCompanySignup.password.max")).required(l18n.t("schemaCompanySignup.password.required")),
  })
  .required()

export const schemaNewCourse = yup
  .object({
    id: yup.number(),
    name: yup.string().required(l18n.t("schemaNewCourse.name.required")),
    description: yup.string().required(l18n.t("schemaNewCourse.description.required")),
    price: yup.number().required(l18n.t("schemaNewCourse.price.required")).typeError(l18n.t("schemaNewCourse.price.typeError")),
    location: yup.string(),
    sponsonrship: yup.string(),
    on_campus: yup.string(),
    part_time: yup.string(),
    full_time: yup.string(),
    training: yup.string(),
    image: yup.string().required(l18n.t("schemaNewCourse.image.required")),
    start_date: yup.date(),
    apprenticenship: yup.string(),
  })
  .required()

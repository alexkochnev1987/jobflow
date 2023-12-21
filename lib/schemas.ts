import * as yup from "yup"

export const schemaCompanySignup = yup
  .object({
    business: yup.string().oneOf(["training", "company"]).required(),
    name: yup.string().required(),
    first_name: yup.string().required(),
    last_name: yup.string().required(),
    vat: yup.string().required(),
    city: yup.string().required(),
    street: yup.string().required(),
    country: yup.string().required(),
    zip: yup.string().required(),
    web: yup.string().url().required(),
    phone: yup.string().required(),
    email: yup.string().email().required(),
    email_requests: yup.string().email().required(),
    email_billing: yup.string().email().required(),
    password: yup.string().min(12).max(60).required(),
  })
  .required()

export const schemaNewCourse = yup
  .object({
    name: yup.string().required(),
    description: yup.string().required(),
    price: yup.number().required(),
    remote: yup.string(),
    on_campus: yup.string(),
    part_time: yup.string(),
    full_time: yup.string(),
    training: yup.string(),
    apprenticenship: yup.string(),
  })
  .required()

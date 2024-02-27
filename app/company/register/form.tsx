"use client"
import { Input } from "@/components/shared/input"
import { signIn } from "next-auth/react"
import { useState } from "react"
import { useForm } from "react-hook-form"
import { yupResolver } from "@hookform/resolvers/yup"

import Cap from "@/icons/cap.svg"
import Building from "@/icons/building.svg"

import Button from "@/components/shared/button"
import { cn } from "@/lib/utils"
import { schemaCompanySignup } from "@/lib/schemas"
import { ROUTES } from "@/lib/constants"
import { Select } from "@/components/shared/select"
import { LoadingDots } from "@/components/shared/icons"
import "react-phone-number-input/style.css"
import PhoneInput from "react-phone-number-input"

export const RegisterForm = () => {
  const [loading, setLoading] = useState(false)
  const [error, setError] = useState("")
  const {
    register,
    getValues,
    setValue,
    handleSubmit,
    control,
    watch,
    formState: { errors },
  } = useForm({
    resolver: yupResolver(schemaCompanySignup),
    defaultValues: { business: "training", country: "Germany" },
  })

  const setPhone = (value: string) => setValue("phone", value)

  const { business, phone } = getValues()

  console.log(errors)
  watch("business")
  watch("phone")

  const isCompany = business === "company"
  const isTraining = business === "training"

  const onSubmit = async (data) => {
    console.log(data)
    setLoading(true)

    try {
      const res = await fetch("/api/company", {
        method: "POST",
        body: JSON.stringify(data),
        headers: {
          "Content-Type": "application/json",
        },
      })

      setLoading(false)
      if (!res.ok) {
        setError((await res.json()).message)
        return
      }
      signIn(undefined, { callbackUrl: ROUTES.DashBoard })
    } catch (error: any) {
      setLoading(false)
      setError(error)
    }
  }

  return (
    <form onSubmit={handleSubmit(onSubmit)} className="mx-auto w-full max-w-md">
      <div className="my-10 text-2xl font-bold leading-7">Registrieren</div>
      {error && (
        <p className="mb-6 rounded bg-red-300 py-4 text-center">{error}</p>
      )}
      <div className="my-5 text-normal font-bold leading-7">Unternehmenstyp</div>
      <input type="hidden" {...register("business")} />
      <div className="flex w-full flex-row gap-1">
        <div
          role="button"
          tabIndex={0}
          onKeyDown={() => {
            setValue("business", "training")
          }}
          onClick={() => {
            setValue("business", "training")
          }}
          className={cn(
            "flex w-1/2 cursor-pointer flex-col justify-center rounded-md border border-gray-300 bg-white py-2 text-center align-middle text-gray-500",
            isTraining && "border-emerald-300 bg-slate-100 text-emerald-300",
          )}
        >
          <Cap
            className={cn(
              "mx-auto h-10 w-10 stroke-gray-500",
              isTraining && "stroke-emerald-300",
            )}
          />
          <p className="font-bold">Bildungsträger</p>
        </div>
        <div
          role="button"
          tabIndex={0}
          onKeyDown={() => {
            setValue("business", "company")
          }}
          onClick={() => {
            setValue("business", "company")
          }}
          className={cn(
            "flex w-1/2 cursor-pointer flex-col justify-center rounded-md border border-gray-300 bg-white text-center align-middle text-gray-500",
            isCompany && "border-emerald-300 bg-slate-100 text-emerald-300",
          )}
        >
          <Building
            className={cn(
              "mx-auto h-10 w-10 stroke-gray-500",
              isCompany && "stroke-emerald-300",
            )}
          />
          <p className="font-bold">Ausbildungsbetrieb</p>
        </div>
      </div>
      {errors.business && (
        <p className="text-red-700">{errors.business.message}</p>
      )}
      <div className="my-5 text-normal font-bold leading-7">Company</div>
      <div className="mb-6 flex flex-col gap-2">
        <Input {...register("name", { required: true })} placeholder="Firmenname" />
        {errors.name && <p className="text-red-700">{errors.name.message}</p>}
        <Input
          {...register("vat", { required: true })}
          placeholder="Steuernummer"
        />
        {errors.vat && <p className="text-red-700">{errors.vat.message}</p>}
        <div className="flex flex-row gap-1">
          <Input
            {...register("street", { required: true })}
            placeholder="Straße"
          />
          <Input
            {...register("zip", { required: true })}
            placeholder="PLZ"
          />
        </div>
        {errors.street && (
          <p className="text-red-700">{errors.street.message}</p>
        )}
        {errors.zip && <p className="text-red-700">{errors.zip.message}</p>}
        <Input {...register("city", { required: true })} placeholder="Stadt" />
        {errors.city && <p className="text-red-700">{errors.city.message}</p>}
        <Select name="Country" {...register("country")}>
          <option value="Afghanistan">Afghanistan</option>
          <option value="Albania">Albania</option>
          <option value="Algeria">Algeria</option>
          <option value="American Samoa">American Samoa</option>
          <option value="Andorra">Andorra</option>
          <option value="Angola">Angola</option>
          <option value="Anguilla">Anguilla</option>
          <option value="Antarctica">Antarctica</option>
          <option value="Antigua and Barbuda">Antigua and Barbuda</option>
          <option value="Argentina">Argentina</option>
          <option value="Armenia">Armenia</option>
          <option value="Aruba">Aruba</option>
          <option value="Australia">Australia</option>
          <option value="Austria">Austria</option>
          <option value="Azerbaijan">Azerbaijan</option>
          <option value="Bahamas">Bahamas</option>
          <option value="Bahrain">Bahrain</option>
          <option value="Bangladesh">Bangladesh</option>
          <option value="Barbados">Barbados</option>
          <option value="Belarus">Belarus</option>
          <option value="Belgium">Belgium</option>
          <option value="Belize">Belize</option>
          <option value="Benin">Benin</option>
          <option value="Bermuda">Bermuda</option>
          <option value="Bhutan">Bhutan</option>
          <option value="Bolivia">Bolivia</option>
          <option value="Bosnia and Herzegovina">Bosnia and Herzegovina</option>
          <option value="Botswana">Botswana</option>
          <option value="Bouvet Island">Bouvet Island</option>
          <option value="Brazil">Brazil</option>
          <option value="British Indian Ocean Territory">
            British Indian Ocean Territory
          </option>
          <option value="Brunei Darussalam">Brunei Darussalam</option>
          <option value="Bulgaria">Bulgaria</option>
          <option value="Burkina Faso">Burkina Faso</option>
          <option value="Burundi">Burundi</option>
          <option value="Cambodia">Cambodia</option>
          <option value="Cameroon">Cameroon</option>
          <option value="Canada">Canada</option>
          <option value="Cape Verde">Cape Verde</option>
          <option value="Cayman Islands">Cayman Islands</option>
          <option value="Central African Republic">
            Central African Republic
          </option>
          <option value="Chad">Chad</option>
          <option value="Chile">Chile</option>
          <option value="China">China</option>
          <option value="Christmas Island">Christmas Island</option>
          <option value="Cocos (Keeling) Islands">
            Cocos (Keeling) Islands
          </option>
          <option value="Colombia">Colombia</option>
          <option value="Comoros">Comoros</option>
          <option value="Congo">Congo</option>
          <option value="Congo, The Democratic Republic of The">
            Congo, The Democratic Republic of The
          </option>
          <option value="Cook Islands">Cook Islands</option>
          <option value="Costa Rica">Costa Rica</option>
          <option value="Cote D'ivoire">Cote Divoire</option>
          <option value="Croatia">Croatia</option>
          <option value="Cuba">Cuba</option>
          <option value="Cyprus">Cyprus</option>
          <option value="Czech Republic">Czech Republic</option>
          <option value="Denmark">Denmark</option>
          <option value="Djibouti">Djibouti</option>
          <option value="Dominica">Dominica</option>
          <option value="Dominican Republic">Dominican Republic</option>
          <option value="Ecuador">Ecuador</option>
          <option value="Egypt">Egypt</option>
          <option value="El Salvador">El Salvador</option>
          <option value="Equatorial Guinea">Equatorial Guinea</option>
          <option value="Eritrea">Eritrea</option>
          <option value="Estonia">Estonia</option>
          <option value="Ethiopia">Ethiopia</option>
          <option value="Falkland Islands (Malvinas)">
            Falkland Islands (Malvinas)
          </option>
          <option value="Faroe Islands">Faroe Islands</option>
          <option value="Fiji">Fiji</option>
          <option value="Finland">Finland</option>
          <option value="France">France</option>
          <option value="French Guiana">French Guiana</option>
          <option value="French Polynesia">French Polynesia</option>
          <option value="French Southern Territories">
            French Southern Territories
          </option>
          <option value="Gabon">Gabon</option>
          <option value="Gambia">Gambia</option>
          <option value="Georgia">Georgia</option>
          <option value="Germany">Germany</option>
          <option value="Ghana">Ghana</option>
          <option value="Gibraltar">Gibraltar</option>
          <option value="Greece">Greece</option>
          <option value="Greenland">Greenland</option>
          <option value="Grenada">Grenada</option>
          <option value="Guadeloupe">Guadeloupe</option>
          <option value="Guam">Guam</option>
          <option value="Guatemala">Guatemala</option>
          <option value="Guinea">Guinea</option>
          <option value="Guinea-bissau">Guinea-bissau</option>
          <option value="Guyana">Guyana</option>
          <option value="Haiti">Haiti</option>
          <option value="Honduras">Honduras</option>
          <option value="Hong Kong">Hong Kong</option>
          <option value="Hungary">Hungary</option>
          <option value="Iceland">Iceland</option>
          <option value="India">India</option>
          <option value="Indonesia">Indonesia</option>
          <option value="Iraq">Iraq</option>
          <option value="Ireland">Ireland</option>
          <option value="Israel">Israel</option>
          <option value="Italy">Italy</option>
          <option value="Jamaica">Jamaica</option>
          <option value="Japan">Japan</option>
          <option value="Jordan">Jordan</option>
          <option value="Kazakhstan">Kazakhstan</option>
          <option value="Kenya">Kenya</option>
          <option value="Kiribati">Kiribati</option>
          <option value="Korea, Republic of">Korea, Republic of</option>
          <option value="Kuwait">Kuwait</option>
          <option value="Kyrgyzstan">Kyrgyzstan</option>
          <option value="Latvia">Latvia</option>
          <option value="Lebanon">Lebanon</option>
          <option value="Lesotho">Lesotho</option>
          <option value="Liberia">Liberia</option>
          <option value="Libyan Arab Jamahiriya">Libyan Arab Jamahiriya</option>
          <option value="Liechtenstein">Liechtenstein</option>
          <option value="Lithuania">Lithuania</option>
          <option value="Luxembourg">Luxembourg</option>
          <option value="Macao">Macao</option>
          <option value="North Macedonia">North Macedonia</option>
          <option value="Madagascar">Madagascar</option>
          <option value="Malawi">Malawi</option>
          <option value="Malaysia">Malaysia</option>
          <option value="Maldives">Maldives</option>
          <option value="Mali">Mali</option>
          <option value="Malta">Malta</option>
          <option value="Marshall Islands">Marshall Islands</option>
          <option value="Martinique">Martinique</option>
          <option value="Mauritania">Mauritania</option>
          <option value="Mauritius">Mauritius</option>
          <option value="Mayotte">Mayotte</option>
          <option value="Mexico">Mexico</option>
          <option value="Micronesia, Federated States of">
            Micronesia, Federated States of
          </option>
          <option value="Moldova, Republic of">Moldova, Republic of</option>
          <option value="Monaco">Monaco</option>
          <option value="Mongolia">Mongolia</option>
          <option value="Montserrat">Montserrat</option>
          <option value="Morocco">Morocco</option>
          <option value="Mozambique">Mozambique</option>
          <option value="Myanmar">Myanmar</option>
          <option value="Namibia">Namibia</option>
          <option value="Nauru">Nauru</option>
          <option value="Nepal">Nepal</option>
          <option value="Netherlands">Netherlands</option>
          <option value="Netherlands Antilles">Netherlands Antilles</option>
          <option value="New Caledonia">New Caledonia</option>
          <option value="New Zealand">New Zealand</option>
          <option value="Nicaragua">Nicaragua</option>
          <option value="Niger">Niger</option>
          <option value="Nigeria">Nigeria</option>
          <option value="Niue">Niue</option>
          <option value="Norfolk Island">Norfolk Island</option>
          <option value="Northern Mariana Islands">
            Northern Mariana Islands
          </option>
          <option value="Norway">Norway</option>
          <option value="Oman">Oman</option>
          <option value="Pakistan">Pakistan</option>
          <option value="Palau">Palau</option>
          <option value="Palestinian Territory, Occupied">
            Palestinian Territory, Occupied
          </option>
          <option value="Panama">Panama</option>
          <option value="Papua New Guinea">Papua New Guinea</option>
          <option value="Paraguay">Paraguay</option>
          <option value="Peru">Peru</option>
          <option value="Philippines">Philippines</option>
          <option value="Pitcairn">Pitcairn</option>
          <option value="Poland">Poland</option>
          <option value="Portugal">Portugal</option>
          <option value="Puerto Rico">Puerto Rico</option>
          <option value="Qatar">Qatar</option>
          <option value="Reunion">Reunion</option>
          <option value="Romania">Romania</option>
          <option value="Russian Federation">Russian Federation</option>
          <option value="Rwanda">Rwanda</option>
          <option value="Saint Helena">Saint Helena</option>
          <option value="Saint Kitts and Nevis">Saint Kitts and Nevis</option>
          <option value="Saint Lucia">Saint Lucia</option>
          <option value="Saint Pierre and Miquelon">
            Saint Pierre and Miquelon
          </option>
          <option value="Saint Vincent and The Grenadines">
            Saint Vincent and The Grenadines
          </option>
          <option value="Samoa">Samoa</option>
          <option value="San Marino">San Marino</option>
          <option value="Sao Tome and Principe">Sao Tome and Principe</option>
          <option value="Saudi Arabia">Saudi Arabia</option>
          <option value="Senegal">Senegal</option>
          <option value="Serbia and Montenegro">Serbia and Montenegro</option>
          <option value="Seychelles">Seychelles</option>
          <option value="Sierra Leone">Sierra Leone</option>
          <option value="Singapore">Singapore</option>
          <option value="Slovakia">Slovakia</option>
          <option value="Slovenia">Slovenia</option>
          <option value="Solomon Islands">Solomon Islands</option>
          <option value="Somalia">Somalia</option>
          <option value="South Africa">South Africa</option>
          <option value="South Georgia and The South Sandwich Islands">
            South Georgia and The South Sandwich Islands
          </option>
          <option value="Spain">Spain</option>
          <option value="Sri Lanka">Sri Lanka</option>
          <option value="Sudan">Sudan</option>
          <option value="Suriname">Suriname</option>
          <option value="Svalbard and Jan Mayen">Svalbard and Jan Mayen</option>
          <option value="Swaziland">Swaziland</option>
          <option value="Sweden">Sweden</option>
          <option value="Switzerland">Switzerland</option>
          <option value="Syrian Arab Republic">Syrian Arab Republic</option>
          <option value="Taiwan, Province of China">
            Taiwan, Province of China
          </option>
          <option value="Tajikistan">Tajikistan</option>
          <option value="Tanzania, United Republic of">
            Tanzania, United Republic of
          </option>
          <option value="Thailand">Thailand</option>
          <option value="Timor-leste">Timor-leste</option>
          <option value="Togo">Togo</option>
          <option value="Tokelau">Tokelau</option>
          <option value="Tonga">Tonga</option>
          <option value="Trinidad and Tobago">Trinidad and Tobago</option>
          <option value="Tunisia">Tunisia</option>
          <option value="Turkey">Turkey</option>
          <option value="Turkmenistan">Turkmenistan</option>
          <option value="Turks and Caicos Islands">
            Turks and Caicos Islands
          </option>
          <option value="Tuvalu">Tuvalu</option>
          <option value="Uganda">Uganda</option>
          <option value="Ukraine">Ukraine</option>
          <option value="United Arab Emirates">United Arab Emirates</option>
          <option value="United Kingdom">United Kingdom</option>
          <option value="United States">United States</option>
          <option value="United States Minor Outlying Islands">
            United States Minor Outlying Islands
          </option>
          <option value="Uruguay">Uruguay</option>
          <option value="Uzbekistan">Uzbekistan</option>
          <option value="Vanuatu">Vanuatu</option>
          <option value="Venezuela">Venezuela</option>
          <option value="Viet Nam">Viet Nam</option>
          <option value="Virgin Islands, British">
            Virgin Islands, British
          </option>
          <option value="Virgin Islands, U.S.">Virgin Islands, U.S.</option>
          <option value="Wallis and Futuna">Wallis and Futuna</option>
          <option value="Western Sahara">Western Sahara</option>
          <option value="Yemen">Yemen</option>
          <option value="Zambia">Zambia</option>
          <option value="Zimbabwe">Zimbabwe</option>
        </Select>
        {errors.country && (
          <p className="text-red-700">{errors.country.message}</p>
        )}
        <Input
          {...register("email_billing", { required: true })}
          placeholder="E-Mail für Rechnungen"
        />
        {errors.email_billing && (
          <p className="text-red-700">{errors.email_billing.message}</p>
        )}
        <PhoneInput
          placeholder="Mobilnummer"
          value={phone}
          onChange={setPhone}
          defaultCountry="DE"
        />
        {errors.phone && <p className="text-red-700">{errors.phone.message}</p>}
        <Input {...register("web", { required: true })} placeholder="Webseite" />
        {errors.web && <p className="text-red-700">{errors.web.message}</p>}
        <div className="my-5 text-normal font-bold leading-7">Kontakt</div>
        <Input
          {...register("first_name", { required: true })}
          placeholder="Vorname"
        />
        {errors.first_name && (
          <p className="text-red-700">{errors.first_name.message}</p>
        )}
        <Input
          {...register("last_name", { required: true })}
          placeholder="Nachname"
        />
        {errors.last_name && (
          <p className="text-red-700">{errors.last_name.message}</p>
        )}
        <Input
          {...register("email_requests", { required: true })}
          placeholder="E-mail für Anfragen"
        />
        {errors.email_requests && (
          <p className="text-red-700">{errors.email_requests.message}</p>
        )}
        <div className="my-5 text-normal font-bold leading-7">Anmeldedaten</div>
        <Input
          {...register("email", { required: true })}
          placeholder="E-mail"
        />
        {errors.email && <p className="text-red-700">{errors.email.message}</p>}
        <Input
          {...register("password", { required: true })}
          placeholder="Passwort"
          type="password"
        />
        {errors.password && (
          <p className="text-red-700">{errors.password.message}</p>
        )}
        {error && <p className="text-red-700">{error}</p>}
        <Button intent="primary" className="rt-reset-button rt-reset-a rt-BaseButton rt-Button mx-auto w-full rounded-full !bg-magenta rt-r-size-4 rt-variant-solid">
          {loading ? <LoadingDots color="#ffffff" /> : "registrieren"}
        </Button>
      </div>
    </form>
  )
}

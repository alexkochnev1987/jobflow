import React from "react"
import Logo from "@/icons/logo.svg"
import l18n from "@/i18n/config"
import { Flex, Grid } from "@radix-ui/themes"
function FooterComponent() {
  return (
    <footer className="mx-auto  flex  max-w-6xl flex-col items-stretch border-t border-solid border-t-[color:var(--grey-300,#D0D5DD)] bg-white px-20 py-12 text-gray-500 max-md:px-5">
      <Flex className="w-full" direction="row" wrap="wrap">
        <ul className="w-1/2 md:w-1/4 lg:w-1/5">
          <li className="pb-1 text-base font-semibold leading-normal text-black">
            {l18n.t("footer.Media", "Media")}
          </li>
          <li>{l18n.t("footer.affiliate")}</li>
          <li>{l18n.t("footer.stories")}</li>
          <li>{l18n.t("footer.press")}</li>
        </ul>
        <ul className="w-1/2 md:w-1/4 lg:w-1/5">
          <li className="pb-1 text-base font-semibold leading-normal text-black">
            {l18n.t("footer.support")}
          </li>
          <li>{l18n.t("footer.institutes")}</li>
          <li>{l18n.t("footer.blog")}</li>
          <li>{l18n.t("footer.FAQ")}</li>
        </ul>
        <ul className="mt-2 w-1/2 md:w-1/4 lg:w-1/5">
          <li className="pb-1 text-base font-semibold leading-normal text-black">
            {l18n.t("footer.About")}
          </li>
          <li>{l18n.t("footer.out-team")}</li>
          <li>{l18n.t("footer.companies")}</li>
          <li>{l18n.t("footer.philosophy")}</li>
        </ul>
        <ul className="mt-2 w-1/2 md:w-1/4 lg:w-1/5">
          <li className="pb-1 text-base font-semibold leading-normal text-black">
            {l18n.t("footer.social")}
          </li>
          <li>{l18n.t("footer.twitter")}</li>
          <li>{l18n.t("footer.linkedin")}</li>
          <li>{l18n.t("footer.facebook")}</li>
        </ul>
        <ul className="mt-2 w-1/2 md:w-1/4 lg:w-1/5">
          <li className="pb-1 text-base font-semibold leading-normal text-black">
            {l18n.t("footer.legal")}
          </li>
          <li>{l18n.t("footer.terms")}</li>
          <li>{l18n.t("footer.privacy")}</li>
          <li>{l18n.t("footer.data-protection")}</li>
          <li>{l18n.t("footer.contact")}</li>
        </ul>
      </Flex>

      <div className="mt-10 flex flex-col  max-md:max-w-full max-md:px-5">
        <div className="mt-6 flex  justify-start gap-5 max-md:max-w-full max-md:flex-wrap">
          <Logo />
          <div className="my-auto grow self-center whitespace-nowrap text-base leading-6 text-gray-400">
            © {new Date().getFullYear()}{" "}
            {l18n.t("footer.ShiftYourCareer. All rights reserved.")}
          </div>
        </div>
      </div>
    </footer>
  )
}

export default FooterComponent

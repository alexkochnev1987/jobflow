/* eslint-disable @next/next/no-img-element */
import { getImageFullUrl } from "@/lib/utils"
import { Courses } from "@prisma/client"
import { Flex, Grid } from "@radix-ui/themes"
import l18n from "@/i18n/config"
import ResourceCard from "@/components/shared/resource-card"

type Props = Partial<Courses> &
  React.ComponentPropsWithoutRef<"div"> & {
    isLoading?: boolean
  }

function ViewCourse({ image, description }: Props) {
  return (
    <>
      <Grid columns="2" gap="4" width="auto" className="my-5">
        <img
          src={getImageFullUrl(image)}
          className="h-full w-full rounded-2xl object-cover"
          alt=""
        />
        <Flex direction="column" gap="4">
          <h2 className="text-lg font-bold leading-7">
            {l18n.t("What you’ll get from this short course")}
          </h2>
          <p className="text-base font-normal leading-normal">
            {l18n.t(description)}
          </p>
        </Flex>
      </Grid>
      <h2 className="text-lg font-bold leading-7"> {l18n.t("Files")}</h2>
      <Grid columns="2">
        <ResourceCard name="File 1" description="File 1" url="test" />
      </Grid>
    </>
  )
}
export default ViewCourse

/* eslint-disable @next/next/no-img-element */
import { getImageFullUrl } from "@/lib/utils"
import { Quizzes } from "@prisma/client"
import { Flex, Grid } from "@radix-ui/themes"
import l18n from "@/i18n/config"
import ResourceCard from "@/components/shared/resource-card"

type Props = {
  quizz: Partial<Quizzes>
} & React.ComponentPropsWithoutRef<"div"> & {
    isLoading?: boolean
  }

function ViewQuizz({
  quizz: { image, description, file, file_name, file_description },
}: Props) {
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
            {l18n.t(
              "view-course.title",
              "What you’ll get from this short course",
            )}
          </h2>
          <p className="text-base font-normal leading-normal">{description}</p>
        </Flex>
      </Grid>

      {file && (
        <Grid columns="2">
          <ResourceCard
            name={file_name}
            description={file_description}
            file={file}
          />
        </Grid>
      )}
    </>
  )
}
export default ViewQuizz

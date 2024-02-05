/* eslint-disable @next/next/no-img-element */
import { getImageFullUrl } from "@/lib/utils"
import { QuizzResource, Quizzes } from "@prisma/client"
import { Flex, Grid } from "@radix-ui/themes"
import l18n from "@/i18n/config"
import ResourceCard from "@/components/shared/resource-card"

type Props = Partial<Quizzes> &
  React.ComponentPropsWithoutRef<"div"> & {
    isLoading?: boolean
    prototypes?: Partial<QuizzResource>[]
  }

function ViewQuizz({ image, description, prototypes }: Props) {
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
            {l18n.t("view-course.title", "What you’ll get from this short course")}
          </h2>
          <p className="text-base font-normal leading-normal">
            {description}
          </p>
        </Flex>
      </Grid>
      {prototypes?.length > 0 && (
        <h2 className="text-lg font-bold leading-7"> {l18n.t("view-course.files", "Files")}</h2>
      )}
      <Grid columns="2">
        {prototypes.map((p) => (
          <ResourceCard
            name={p.description}
            description={p.description}
            file={p.file}
            key={p.id}
          />
        ))}
      </Grid>
    </>
  )
}
export default ViewQuizz

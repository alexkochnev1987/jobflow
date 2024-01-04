import { Box, Flex, Grid } from "@radix-ui/themes"
import Skeleton from "react-loading-skeleton"

export default function Loading() {
  return (
    <Grid columns="2" gap="3" width="auto">
      <Box>
        <Skeleton height={300} width={300} count={1} />
      </Box>
      <Box>
        <Skeleton className="w-full" height={30} count={3} />
      </Box>
    </Grid>
  )
}

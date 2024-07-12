import { useBreakpointValue } from "@chakra-ui/react"
// const breakpoints = {
//   base: '0em', // 0px
//   sm: '30em', // ~480px. em is a relative unit and is dependant on the font size.
//   md: '48em', // ~768px
//   lg: '62em', // ~992px
//   xl: '80em', // ~1280px
//   '2xl': '96em', // ~1536px
// }

/**
 * Custom hook to determine if the screen width is within a mobile range using Chakra UI's useBreakpointValue.
 * 
 * @returns {boolean} - Returns true if the screen width is considered "base" or "sm", and false otherwise.
 */
export default function useIsMobile() {
  const isMobile = useBreakpointValue(
    {
      base: true,
      sm: true,
      md: false,
    },
    {
      fallback: 'md',
    },
  )

  return isMobile
}
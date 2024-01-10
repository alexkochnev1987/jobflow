import { useEffect, useRef, ReactNode, Dispatch, SetStateAction } from "react"
import { AnimatePresence, motion, useAnimation } from "framer-motion"

export default function Leaflet({
  setShow,
  children,
}: {
  setShow: Dispatch<SetStateAction<boolean>>
  children: ReactNode
}) {
  const leafletRef = useRef<HTMLDivElement>(null)
  const controls = useAnimation()
  const transitionProps = { type: "spring", stiffness: 500, damping: 30 }
  useEffect(() => {
    controls.start({
      x: -80,
      transition: transitionProps,
    })
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [])

  async function handleDragEnd(_: any, info: any) {
    const offset = info.offset.y
    const velocity = info.velocity.y
    const width = leafletRef.current?.getBoundingClientRect().width || 0
    if (offset > width / 2 || velocity > 800) {
      await controls.start({ x: "100%", transition: transitionProps })
      setShow(false)
    } else {
      controls.start({ x: 0, transition: transitionProps })
    }
  }

  return (
    <AnimatePresence>
      <motion.div
        ref={leafletRef}
        key="leaflet"
        className="group fixed inset-y-0 bottom-0 z-40 w-screen cursor-grab bg-white pb-5 active:cursor-grabbing sm:hidden"
        initial={{ x: "100%" }}
        animate={controls}
        exit={{ x: "100%" }}
        transition={transitionProps}
        drag="x"
        dragDirectionLock
        onDragEnd={handleDragEnd}
        dragElastic={{ top: 0, bottom: 1 }}
        dragConstraints={{ top: 0, bottom: 0 }}
      >
        <div
          className={`rounded-t-4xl -mb-1 flex h-7 w-full items-center justify-center border-t border-gray-200`}
        >
          <div className="-mr-1 h-1 w-6 rounded-full bg-gray-300 transition-all group-active:rotate-12" />
          <div className="h-1 w-6 rounded-full bg-gray-300 transition-all group-active:-rotate-12" />
        </div>
        {children}
      </motion.div>
      <motion.div
        key="leaflet-backdrop"
        className="fixed inset-0 z-30 bg-gray-100 bg-opacity-10 backdrop-blur"
        initial={{ opacity: 0 }}
        animate={{ opacity: 1 }}
        exit={{ opacity: 0 }}
        onClick={() => setShow(false)}
      />
    </AnimatePresence>
  )
}

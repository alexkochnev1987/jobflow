"use client"
import {
  Dialog,
  DialogContent,
  DialogDescription,
  DialogFooter,
  DialogHeader,
  DialogTitle,
  DialogTrigger,
} from "@/components/ui/dialog"
import { Button } from "@radix-ui/themes"

export default function DialogDemo() {
  return (
    <Dialog>
      <DialogTrigger asChild>
        <Button
          variant="solid"
          size="4"
          className="my-4 w-full !bg-rose-500 hover:!bg-rose-400"
        >
          Unverbindlich anfragen
        </Button>
      </DialogTrigger>
      <DialogContent className="sm:max-w-[425px]">
        <DialogHeader>
          <DialogTitle className="text-base">Contact</DialogTitle>
          <DialogDescription>Desc</DialogDescription>
        </DialogHeader>
        <div className="grid gap-4 py-4">
          <div className="grid grid-cols-4 items-center gap-4">w</div>
          <div className="grid grid-cols-4 items-center gap-4">w</div>
        </div>
        <DialogFooter>
          <Button
            type="submit"
            className="!rounded-sm !bg-rose-500 !p-2 font-bold !text-white hover:!bg-rose-400"
          >
            Send
          </Button>
        </DialogFooter>
      </DialogContent>
    </Dialog>
  )
}

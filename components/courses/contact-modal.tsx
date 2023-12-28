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
        <Button  variant="soft">unverbindlich anfragen</Button>
      </DialogTrigger>
      <DialogContent className="sm:max-w-[425px]">
        <DialogHeader>
          <DialogTitle>Edit profile</DialogTitle>
          <DialogDescription>
            Make changes to your profile here. Click save when youre done.
          </DialogDescription>
        </DialogHeader>
        <div className="grid gap-4 py-4">
          <div className="grid grid-cols-4 items-center gap-4">w</div>
          <div className="grid grid-cols-4 items-center gap-4">w</div>
        </div>
        <DialogFooter>
          <Button type="submit" variant="soft">
            Save changes
          </Button>
        </DialogFooter>
      </DialogContent>
    </Dialog>
  )
}

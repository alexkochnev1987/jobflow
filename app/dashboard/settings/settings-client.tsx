"use client"
import { Button } from "@/components/ui/button"
import { Flex, TextFieldInput } from "@radix-ui/themes"
import { useForm } from "react-hook-form"
import {
  AlertDialog,
  AlertDialogAction,
  AlertDialogCancel,
  AlertDialogContent,
  AlertDialogDescription,
  AlertDialogFooter,
  AlertDialogHeader,
  AlertDialogTitle,
} from "@/components/ui/alert-dialog"
import { useState } from "react"
import { LoadingDots } from "@/components/shared/icons"
import { signOut } from "next-auth/react"
import { yupResolver } from "@hookform/resolvers/yup"
import { schemaChangePasswrd } from "@/lib/schemas"

export default function SettingsClient({ deleteUser, updatePassword }) {
  const {
    register,
    watch,
    getValues,

    handleSubmit,

    formState: { isLoading, errors },
  } = useForm({
    resolver: yupResolver(schemaChangePasswrd),
  })
  const [openConfirmDelete, setOpenConfirmDelete] = useState(false)

  async function handleDeleteUser() {
    await deleteUser()
    signOut()
  }

  function handleUpdatePassword(data) {
    updatePassword(data.password)
    alert("Password updated successfully")
  }
  return (
    <>
      <AlertDialog open={openConfirmDelete}>
        <AlertDialogContent>
          <AlertDialogHeader>
            <AlertDialogTitle>Are you absolutely sure?</AlertDialogTitle>
          </AlertDialogHeader>
          <AlertDialogFooter>
            <AlertDialogCancel
              onClick={() => setOpenConfirmDelete(false)}
              className="font-bold !text-black"
            >
              Cancel
            </AlertDialogCancel>
            <AlertDialogAction
              className="bg-red-700 !font-bold !text-white hover:bg-red-500"
              onClick={handleDeleteUser}
            >
              {isLoading ? <LoadingDots color="#ffffff" /> : "Delete"}
            </AlertDialogAction>
          </AlertDialogFooter>
        </AlertDialogContent>
      </AlertDialog>
      <Flex direction="column" gap="2" className="max-w-48 m-auto">
        <form onSubmit={handleSubmit(handleUpdatePassword)}>
          <Flex direction="column" gap="2">
            <TextFieldInput
              type="password"
              placeholder="New password"
              {...register("password", {
                required: true,
              })}
            />
            {errors.password && (
              <p className="text-red-700">{errors.password.message}</p>
            )}
            <TextFieldInput
              {...register("password_confirmation", {
                required: true,
                validate: (val: string) => {
                  if (watch("password") != val) {
                    return "Your passwords do no match"
                  }
                },
              })}
              type="password"
              placeholder="Confirm password"
            />
            {errors.password_confirmation && (
              <p className="text-red-700">
                {errors.password_confirmation.message}
              </p>
            )}
            <Button variant="default" type="submit">
              Update password
            </Button>
          </Flex>
        </form>
        <Button
          variant="destructive"
          onClick={() => setOpenConfirmDelete(true)}
        >
          Delete account
        </Button>
      </Flex>
    </>
  )
}

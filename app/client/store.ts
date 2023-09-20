import { create } from "zustand"
import { devtools, persist } from "zustand/middleware"

interface Response {
  question_id: string
  response: string | number
}

interface UserState {
  id: string
  responses: Response[]
  step: number
  setStep: (step: number) => void
  findResponse: (question_id: string) => Response | undefined
  save: (question_id: string, response: string | number) => void
}

export const userStore = create<UserState>()(
  devtools(
    persist(
      (set, get) => ({
        step: 1,
        id: Math.floor(Math.random() * 10_000_000).toString(),
        responses: [],
        setStep: (step: number) =>
          set((state) => ({
            ...state,
            step,
          })),
        findResponse: (question_id) =>
          get().responses.find((r) => r.question_id === question_id),
        save: (question_id, response) =>
          set((state) => {
            const newState = { ...state }
            const savedResponse = newState.responses.find(
              (r) => r.question_id === question_id,
            )

            if (savedResponse) {
              savedResponse.response = response
            } else {
              newState.responses.push({
                question_id,
                response,
              })
            }

            return newState
          }),
      }),
      {
        name: "user-storage",
      },
    ),
  ),
)

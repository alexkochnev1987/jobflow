import { create } from "zustand"
import { devtools, persist } from "zustand/middleware"

interface Response {
  question_id: string
  response: string
}

interface UserState {
  id: string
  responses: Response[]
  findResponse: (question_id: string) => Response | undefined
  save: (question_id: string, response: string) => void
}

export const userStore = create<UserState>()(
  devtools(
    persist(
      (set, get) => ({
        id: Math.floor(Math.random() * 10_000_000).toString(),
        responses: [],
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

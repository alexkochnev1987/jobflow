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
        id: Date.now().toString(),
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

            sendQuestionsAndResponses(state.id, question_id, response)

            return newState
          }),
      }),
      {
        name: "user-storage",
      },
    ),
  ),
)

function sendQuestionsAndResponses(
  uid: string,
  questionId: string,
  questionResponse: string | number,
) {
  if (!uid || uid === "") return
  if (!questionId || questionId === "") return
  if (!questionResponse || questionResponse === "") return
  return fetch("/jobflow/api/users", {
    method: "POST",
    headers: {
      "Content-Type": "application/json",
    },
    body: JSON.stringify({ uid, questionId, questionResponse }),
  })
}

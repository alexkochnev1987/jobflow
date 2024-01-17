import { create } from "zustand"
import { devtools, persist } from "zustand/middleware"

interface Response {
  question_id: number
  response: string | number
}

interface UserState {
  id: string
  responses: Response[]
  step: number
  totalQuestions: number
  undoLast: () => void
  setStep: (step: number) => void
  findResponse: (question_id: number) => Response | undefined
  save: (question_id: number, response: string | number) => void
}

export const userStore = create<UserState>()(
  devtools(
    persist(
      (set, get) => ({
        step: 1,
        totalQuestions: 0,
        id: Date.now().toString(),
        responses: [],
        undoLast: () => {
          const responses = get().responses
          const lastResponse = responses.pop()
          if (lastResponse) {
            set((state) => ({
              ...state,
              responses,
            }))
          }
          return lastResponse?.response || ""
        },
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
        name: "user-storage-v1",
      },
    ),
  ),
)

function sendQuestionsAndResponses(
  uid: string,
  questionId: number,
  questionResponse: string | number,
) {
  if (!uid || uid === "") return
  if (!questionId) return
  if (!questionResponse || questionResponse === "") return
  return fetch("/api/users", {
    method: "POST",
    headers: {
      "Content-Type": "application/json",
    },
    body: JSON.stringify({
      uid,
      questionId,
      questionResponse: `${questionResponse}`,
    }),
  })
}

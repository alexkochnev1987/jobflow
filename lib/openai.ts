import OpenAI from "openai"

const openai = new OpenAI({
  apiKey: process.env.OPENAI_API_KEY,
})

// https://platform.openai.com/docs/guides/gpt/function-calling

export async function completition(prompt: string) {
  const completion = await openai.chat.completions.create({
    messages: [{ role: "system", content: prompt }],
    model: process.env.OPENAI_CHAT_MODEL,
    functions: [
      {
        name: "getMatchingCareers",
        description: "get the best matching career from the list of responses",
        parameters: {
          type: "object",
          properties: {
            youAtWork: {
              type: "string",
            },
            strengths: {
              type: "string",
            },
            careers: {
              type: "array",
              items: {
                type: "object",
                properties: {
                  career: {
                    type: "string",
                  },
                  rating: {
                    type: "number",
                  },
                  uid: {
                    type: "string",
                  },
                },
              },
            },
          },
          required: ["careers", "youAtWork", "strengths"],
        },
      },
    ],
    function_call: "auto",
  })

  return completion
}

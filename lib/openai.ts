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
              description: "Description of the user's work preferences",
            },
            strengths: {
              type: "string",
              description: "Description of the user's strengths",
            },
            careers: {
              type: "array",
              description: "List of available career options",
              items: {
                type: "object",
                properties: {
                  career: {
                    type: "string",
                    description: "Name of the career option",
                  },
                  rating: {
                    type: "number",
                    description: "Rating of the career option",
                    minimum: 0,
                    maximum: 100,
                  },
                  uid: {
                    type: "string",
                    description: "Unique identifier for the career option",
                  },
                },
              },
            },
          },
          required: ["careers", "youAtWork", "strengths"],
        },
      },
    ],
    function_call: {
      name: "getMatchingCareers",
    },
  })

  return completion
}

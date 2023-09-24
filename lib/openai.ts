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
        name: "",
        description: "",
        parameters: {
          required: ["location"],
          location: {
            type: "string",
            description: "The city and state, e.g. San Francisco, CA",
          },
        },
      },
    ],
    function_call: "auto",
  })

  console.log(completion.choices[0])
}

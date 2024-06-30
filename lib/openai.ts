import OpenAI, { ClientOptions } from "openai"
import { Langfuse, LangfuseTraceClient } from "langfuse";

const clientOptions: ClientOptions = {
  apiKey: process.env.OPENAI_API_KEY,
}

if (process.env.OPENAI_API_BASE_URL) {
  console.debug('Using custom OPENAI API BASE URL', process.env.OPENAI_API_BASE_URL)
  clientOptions.baseURL = process.env.OPENAI_API_BASE_URL
}

const openai = new OpenAI(clientOptions)

export function getLangFuse() {
  return new Langfuse({
    secretKey: process.env.LANGFUSE_SECRET,
    publicKey: process.env.LANGFURE_PUBLIC,
    baseUrl: process.env.LANGFUSE_URL
  });
}


// https://platform.openai.com/docs/guides/gpt/function-calling

export async function completition(prompt: string, traceClient: LangfuseTraceClient) {
  const generation = traceClient.generation({
    name: "function-call",
    model: process.env.OPENAI_CHAT_MODEL,
    input: prompt,
  });
  const completion = await openai.chat.completions.create({
    messages: [{
      role: "system",
      content: prompt,
    }],
    model: process.env.OPENAI_CHAT_MODEL,

    functions: [
      {
        name: "getMatchingCareers",
        description: "get the best matching career from the list of responses",
        parameters: {
          type: "object",
          properties: {
            careers: {
              type: "array",
              description: "List of available career options",
              items: {
                type: "object",
                properties: {
                  // career: {
                  //   type: "string",
                  //   description: "Name of the career option",
                  // },
                  rating: {
                    type: "number",
                    description: "Rating of the career option",
                    minimum: 10,
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
          required: ["careers"],
        },
      },
    ],
    function_call: {
      name: "getMatchingCareers",
    },
  });

  generation.update({
    completionStartTime: new Date(),
  });

  // Example end - sets endTime, optionally pass a body
  generation.end({
    output: completion,
  });
  return completion
}

package main

import (
    "context"
    "log"

    "github.com/firebase/genkit/go/ai"
    "github.com/firebase/genkit/go/genkit"
    "github.com/firebase/genkit/go/plugins/googlegenai"
)

func main() {
    ctx := context.Background()

    // Initialize Genkit with the Google AI plugin and Gemini 2.0 Flash.
    g, err := genkit.Init(ctx,
        genkit.WithPlugins(&googlegenai.GoogleAI{}),
        genkit.WithDefaultModel("googleai/gemini-2.5-flash"),
    )
    if err != nil {
        log.Fatalf("could not initialize Genkit: %v", err)
    }

    resp, err := genkit.Generate(ctx, g, ai.WithPrompt("What is the meaning of life?"))
    if err != nil {
        log.Fatalf("could not generate model response: %v", err)
    }

    log.Println(resp.Text())
}
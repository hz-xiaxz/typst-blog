import { glob } from "astro/loaders";
import { defineCollection, z } from "astro:content";

const blog = defineCollection({
  loader: glob({ base: "./content/article", pattern: "**/*.typ" }),
  schema: z.object({
    title: z.string(),
    author: z.string().optional(),
    description: z.any().optional(),
    date: z.coerce.date(),
    updatedDate: z.coerce.date().optional(),
    tags: z.array(z.string()).optional(),
  }),
});

export const collections = { blog };

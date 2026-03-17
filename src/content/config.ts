import { defineCollection, z } from 'astro:content'
import { glob } from 'astro/loaders'

const locations = defineCollection({
  loader: glob({ pattern: '**/*.md', base: './src/content/locations' }),
  schema: z.object({
    city: z.string(),
    state: z.string().optional(),
    h1: z.string(),
    title: z.string(),
    description: z.string(),
    heroImage: z.string().optional(),
    neighborhoods: z.array(z.string()).optional(),
    landmarks: z.array(z.string()).optional(),
    priceRange: z.string().optional(),
    keywords: z.array(z.string()).optional(),
    faqs: z.array(z.object({
      question: z.string(),
      answer: z.string(),
    })).optional(),
  })
})

const services = defineCollection({
  loader: glob({ pattern: '**/*.md', base: './src/content/services' }),
  // images[] usa z.string() porque las cargamos con import.meta.glob en el template
  // (Astro no puede optimizar paths dinámicos desde frontmatter JSON)
  schema: z.object({
    name: z.string(),
    title: z.string(),
    description: z.string(),
    heroImage: z.string().optional(),
    price: z.string().optional(),
    duration: z.string().optional(),
    keywords: z.array(z.string()).optional(),
    images: z.array(z.object({
      url: z.string(),
      alt: z.string(),
      position: z.enum(['hero', 'mid', 'closing', 'gallery']),
      aspectRatio: z.enum(['16:9', '4:3']).default('16:9'),
    })).optional(),
  })
})

export const collections = { locations, services }

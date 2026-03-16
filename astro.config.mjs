import { defineConfig } from 'astro/config'
import sitemap from '@astrojs/sitemap'
import netlify from '@astrojs/netlify'
import tailwind from '@astrojs/tailwind'

export default defineConfig({
  site: '__SITE_URL__',
  output: 'static',
  adapter: netlify(),
  integrations: [
    sitemap({
      filter: (page) => !page.includes('/gracias') && !page.includes('/404'),
    }),
    tailwind(),
  ],
  image: {
    domains: ['images.unsplash.com', 'images.pexels.com'],
    remotePatterns: [{ protocol: 'https' }],
  },
  trailingSlash: 'always',
  prefetch: {
    prefetchAll: false,
    defaultStrategy: 'hover',
  },
})

import { defineConfig } from 'astro/config'
import sitemap from '@astrojs/sitemap'
import netlify from '@astrojs/netlify'
import tailwind from '@astrojs/tailwind'
import partytown from '@astrojs/partytown'

export default defineConfig({
  site: '__SITE_URL__',
  output: 'static',
  adapter: netlify(),
  integrations: [
    sitemap({
      filter: (page) => !page.includes('/gracias') && !page.includes('/404'),
    }),
    tailwind(),
    partytown({
      config: {
        forward: ['dataLayer.push'],  // GTM dataLayer funciona desde Web Worker
      },
    }),
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

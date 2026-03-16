import type { APIRoute } from 'astro'

export const GET: APIRoute = ({ site }) => {
  const siteUrl = site?.toString() ?? ''
  const robotsTxt = [
    'User-agent: *',
    'Allow: /',
    '',
    '# AI crawlers — permitir para visibilidad en AI search',
    'User-agent: GPTBot',
    'Allow: /',
    '',
    'User-agent: ClaudeBot',
    'Allow: /',
    '',
    'User-agent: PerplexityBot',
    'Allow: /',
    '',
    'User-agent: Googlebot',
    'Allow: /',
    '',
    `Sitemap: ${siteUrl}sitemap-index.xml`,
  ].join('\n')

  return new Response(robotsTxt, {
    headers: { 'Content-Type': 'text/plain; charset=utf-8' },
  })
}

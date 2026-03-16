# Astro SAB Starter

Template para proyectos Astro 5 optimizados para **SEO local de negocios SAB** (Service Area Business) — negocios que prestan servicio en un área geográfica sin dirección física pública.

Usado por el skill `astro-local-seo` para Claude Code.

## Stack

- **Astro 5** — SSG, Content Collections con glob loader
- **Tailwind CSS** — diseño con colores de marca configurables
- **Netlify** — deploy, Forms (sin JS), headers de seguridad
- **Schema.org SAB** — `areaServed`, sin `address`, JSON-LD SSG
- **Astro Image** — AVIF/WebP automático, LCP optimizado

## Uso con el skill

Este template se usa automáticamente desde el comando `/astro-local-seo init`. No hace falta clonarlo manualmente.

## Placeholders

Los ficheros del template usan el formato `__NOMBRE__` para las variables que el skill reemplaza:

| Placeholder | Descripción |
|-------------|-------------|
| `__PROJECT_SLUG__` | Slug del proyecto (ej: `fontaneria-lopez`) |
| `__SITE_URL__` | URL completa del sitio (ej: `https://fontaneria-lopez.es`) |
| `__BUSINESS_NAME__` | Nombre del negocio |
| `__SCHEMA_TYPE__` | Tipo Schema.org (ej: `Plumber`, `Electrician`) |
| `__PHONE__` | Teléfono de contacto |
| `__EMAIL__` | Email de contacto |
| `__CITY_PRIMARY__` | Ciudad principal de servicio |
| `__SERVICE_1__` | Primer servicio ofrecido |
| `__BRAND_PRIMARY__` | Color primario en hex (ej: `#1e40af`) |
| `__BRAND_SECONDARY__` | Color secundario en hex |
| `__BRAND_ACCENT__` | Color de acento en hex (ej: `#f97316`) |
| `__BUSINESS_DESCRIPTION__` | Descripción breve del negocio (1-2 frases) |
| `__RATING_VALUE__` | Nota media de reseñas reales (ej: `4.8`). Si se deja sin reemplazar, el schema `aggregateRating` no se inyecta. |
| `__REVIEW_COUNT__` | Número total de reseñas reales (ej: `47`). Solo usar con datos reales. |

## Estructura

```
src/
├── data/business.json          ← fuente única de verdad (sin address)
├── content/
│   ├── config.ts               ← colecciones: locations, services
│   ├── locations/              ← .md por ciudad (getStaticPaths automático)
│   └── services/               ← .md por servicio (getStaticPaths automático)
├── layouts/BaseLayout.astro    ← SEO, OG, schema slot, Footer, CookieBanner
├── components/                 ← SABSchema, Hero, ServiceCard, CityGrid…
├── pages/
│   ├── index.astro
│   ├── [city].astro            ← FAQPage schema dinámico
│   ├── services/[service].astro
│   ├── gracias.astro           ← goal de conversión para Analytics/Ads
│   ├── 404.astro
│   ├── robots.txt.ts           ← permite GPTBot, ClaudeBot, PerplexityBot
│   └── legal/                  ← RGPD: aviso legal, privacidad, cookies
└── styles/global.css
```

## Licencia

MIT

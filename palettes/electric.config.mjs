// PALETA: electric
// Ideal para: electricistas, HVAC, instalaciones, tecnología, seguridad
// Fuentes: Space Grotesk (tech, moderna, contundente)
// Google Fonts URL:
// https://fonts.googleapis.com/css2?family=Space+Grotesk:wght@400;500;600;700&display=swap

/** @type {import('tailwindcss').Config} */
export default {
  content: ['./src/**/*.{astro,html,js,ts,jsx,tsx}'],
  theme: {
    extend: {
      colors: {
        brand: {
          primary:   '#1d4ed8',  // blue-700  — eléctrico
          secondary: '#1e3a8a',  // blue-900  — noche
          accent:    '#facc15',  // yellow-400 — rayo
          dark:      '#0f172a',
          light:     '#eff6ff',  // blue-50
        },
      },
      fontFamily: {
        sans:    ['Space Grotesk', 'system-ui', 'sans-serif'],
        heading: ['Space Grotesk', 'system-ui', 'sans-serif'],
      },
    },
  },
  plugins: [
    require('@tailwindcss/typography'),
  ],
}

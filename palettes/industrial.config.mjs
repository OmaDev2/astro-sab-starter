// PALETA: industrial
// Ideal para: herreros, fontaneros, roofing, construcción, soldadura
// Fuentes: Oswald (titulares) + Inter (cuerpo)
// Google Fonts URL:
// https://fonts.googleapis.com/css2?family=Oswald:wght@400;500;600;700&family=Inter:wght@400;500;600;700;800&display=swap

/** @type {import('tailwindcss').Config} */
export default {
  content: ['./src/**/*.{astro,html,js,ts,jsx,tsx}'],
  theme: {
    extend: {
      colors: {
        brand: {
          primary:   '#1e293b',  // slate-800 — acero oscuro
          secondary: '#0f172a',  // slate-900 — hierro
          accent:    '#d97706',  // amber-600 — fuego/óxido
          dark:      '#0f172a',
          light:     '#f8fafc',
        },
      },
      fontFamily: {
        sans:    ['Inter', 'system-ui', 'sans-serif'],
        heading: ['Oswald', 'system-ui', 'sans-serif'],
      },
    },
  },
  plugins: [
    require('@tailwindcss/typography'),
  ],
}

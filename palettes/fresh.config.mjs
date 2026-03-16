// PALETA: fresh
// Ideal para: limpieza doméstica, fontanería residencial, mudanzas, hogar
// Fuentes: Nunito (amigable, accesible, de confianza)
// Google Fonts URL:
// https://fonts.googleapis.com/css2?family=Nunito:wght@400;500;600;700;800&display=swap

/** @type {import('tailwindcss').Config} */
export default {
  content: ['./src/**/*.{astro,html,js,ts,jsx,tsx}'],
  theme: {
    extend: {
      colors: {
        brand: {
          primary:   '#0f766e',  // teal-700 — limpio, fresco
          secondary: '#0d9488',  // teal-600
          accent:    '#f97316',  // orange-500 — energía
          dark:      '#042f2e',
          light:     '#f0fdfa',  // teal-50
        },
      },
      fontFamily: {
        sans:    ['Nunito', 'system-ui', 'sans-serif'],
        heading: ['Nunito', 'system-ui', 'sans-serif'],
      },
    },
  },
  plugins: [
    require('@tailwindcss/typography'),
  ],
}

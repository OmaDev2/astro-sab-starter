// PALETA: premium
// Ideal para: abogados, consultoras, servicios financieros, reformas de lujo
// Fuentes: Playfair Display (titulares elegantes) + Lato (cuerpo)
// Google Fonts URL:
// https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;500;600;700;800&family=Lato:wght@300;400;700&display=swap

/** @type {import('tailwindcss').Config} */
export default {
  content: ['./src/**/*.{astro,html,js,ts,jsx,tsx}'],
  theme: {
    extend: {
      colors: {
        brand: {
          primary:   '#1e3a5f',  // navy
          secondary: '#0f2744',  // navy oscuro
          accent:    '#b45309',  // amber-700 — oro viejo
          dark:      '#0c1829',
          light:     '#fdfaf6',  // crema
        },
      },
      fontFamily: {
        sans:    ['Lato', 'system-ui', 'sans-serif'],
        heading: ['Playfair Display', 'Georgia', 'serif'],
      },
    },
  },
  plugins: [
    require('@tailwindcss/typography'),
  ],
}

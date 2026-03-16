// PALETA: nature
// Ideal para: jardinería, paisajismo, limpieza, pest-control, agricultura
// Fuentes: DM Sans (moderna, limpia)
// Google Fonts URL:
// https://fonts.googleapis.com/css2?family=DM+Sans:wght@400;500;600;700;800&display=swap

/** @type {import('tailwindcss').Config} */
export default {
  content: ['./src/**/*.{astro,html,js,ts,jsx,tsx}'],
  theme: {
    extend: {
      colors: {
        brand: {
          primary:   '#166534',  // green-800 — verde profundo
          secondary: '#14532d',  // green-900 — bosque
          accent:    '#84cc16',  // lime-400  — hoja fresca
          dark:      '#052e16',
          light:     '#f0fdf4',  // green-50
        },
      },
      fontFamily: {
        sans:    ['DM Sans', 'system-ui', 'sans-serif'],
        heading: ['DM Sans', 'system-ui', 'sans-serif'],
      },
    },
  },
  plugins: [
    require('@tailwindcss/typography'),
  ],
}

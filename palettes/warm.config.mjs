// PALETA: warm
// Ideal para: parquetista, pintor, carpintero, reformas hogar, tapicero
// Fuentes: Raleway (elegante, calidez artesanal)
// Google Fonts URL:
// https://fonts.googleapis.com/css2?family=Raleway:wght@400;500;600;700;800&display=swap

/** @type {import('tailwindcss').Config} */
export default {
  content: ['./src/**/*.{astro,html,js,ts,jsx,tsx}'],
  theme: {
    extend: {
      colors: {
        brand: {
          primary:   '#92400e',  // amber-800 — madera oscura
          secondary: '#78350f',  // amber-900 — caoba
          accent:    '#d97706',  // amber-600 — ámbar cálido
          dark:      '#1c0a00',
          light:     '#fffbeb',  // amber-50 — crema cálida
        },
      },
      fontFamily: {
        sans:    ['Raleway', 'system-ui', 'sans-serif'],
        heading: ['Raleway', 'system-ui', 'sans-serif'],
      },
    },
  },
  plugins: [
    require('@tailwindcss/typography'),
  ],
}

/** @type {import('tailwindcss').Config} */
export default {
  content: ['./src/**/*.{astro,html,js,ts,jsx,tsx}'],
  theme: {
    extend: {
      colors: {
        brand: {
          // Mapeados a las variables CSS de DaisyUI — cambian automáticamente con data-theme
          primary: 'hsl(var(--p) / <alpha-value>)',
          accent:  'hsl(var(--a) / <alpha-value>)',
          dark: '#0f172a',
          light: '#f8fafc',
        }
      },
      fontFamily: {
        sans: ['Inter', 'system-ui', 'sans-serif'],
        heading: ['Inter', 'system-ui', 'sans-serif'],
      },
    },
  },
  plugins: [
    require('@tailwindcss/typography'),
    require('daisyui'),
  ],
  daisyui: {
    themes: true,   // habilita los 35 temas built-in
    logs: false,
  },
}

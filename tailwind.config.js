/** @type {import('tailwindcss').Config} */
module.exports = {
  darkMode: 'class',
  content: ['./app/**/*.{js,ts,jsx,tsx}', './components/**/*.{js,ts,jsx,tsx}'],
  theme: {
    extend: {
      fontFamily: { sans: ['Space Grotesk', 'sans-serif'] },
      colors: {
        blue: { DEFAULT: '#4F6EF7', soft: '#EEF1FE', txt: '#2a47c9' },
      },
    },
  },
  plugins: [],
}

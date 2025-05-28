/** @type {import('tailwindcss').Config} */

import daisyui from "daisyui"
import typography from "@tailwindcss/typography"

export default {
  content: ["./src/**/*.{html,astro,vue,js,ts}"],
  theme: {
    extend: {
    },
  },
  plugins: [
    daisyui, typography
  ],
  daisyui: {
    themes: ["dark", "light"],
  },
}


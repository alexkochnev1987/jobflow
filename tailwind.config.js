/** @type {import('tailwindcss').Config} */

const plugin = require("tailwindcss/plugin")
module.exports = {
  darkMode: ["class"],
  mode: "jit",
  content: [
    "./pages/**/*.{ts,tsx}",
    "./components/**/*.{ts,tsx}",
    "./app/**/*.{ts,tsx}",
    "./src/**/*.{ts,tsx}",
  ],
  future: {
    hoverOnlyWhenSupported: true,
  },
  safelist: ["text-center", "py-10", "mr-2"],

  theme: {
    container: {
      center: true,
      padding: "2rem",
      screens: {
        "2xl": "1400px",
      },
    },
    extend: {
      fontFamily: {
        display: ["var(--font-inter)", "Inter", "system-ui", "sans-serif"],
        default: ["var(--font-inter)", "Inter", "system-ui", "sans-serif"],
      },
      fontSize: {
        sm: "0.8rem",
        base: "1rem",
        xl: "1.5rem",
        "2xl": "1.563rem",
        "3xl": "1.953rem",
        "4xl": "2.441rem",
        "5xl": "3.052rem",
      },
      colors: {
        border: "hsla(220, 17%, 93%, 1)",
        input: "hsl(217, 16%, 84%)",
        ring: "hsl(175, 47%, 57%)",
        background: "hsl(0, 0%, 100%)",
        foreground: "hsl(240, 2%, 26%)",
        lightBlue: "#F3F6FC",
        lightGreen: "#5DC4BC",
        primary: {
          DEFAULT: "hsl(175, 47%, 67%)",
          foreground: "hsla(0, 0%, 100%, 1)",
        },
        secondary: {
          DEFAULT: "hsl(346, 100%, 59%)",
          foreground: "hsl(0, 0%, 100%)",
        },
        destructive: {
          DEFAULT: "hsl(346, 100%, 59%)",
          foreground: "hsl(0, 0%, 100%)",
        },
        muted: {
          DEFAULT: "hsl(216, 24%, 96%)",
          foreground: "hsl(0, 0%, 0%)",
        },
        accent: {
          DEFAULT: "hsl(175, 47%, 67%)",
          foreground: "hsla(0, 0%, 100%, 1)",
        },
        popover: {
          DEFAULT: "hsla(0, 0%, 100%, 1)",
          foreground: "hsla(217, 24%, 27%, 1)",
        },
        card: {
          DEFAULT: "hsla(0, 0%, 100%, 1)",
          foreground: "hsla(217, 24%, 27%, 1)",
        },
      },
      borderRadius: {
        lg: "var(--radius)",
        md: "calc(var(--radius) - 2px)",
        sm: "calc(var(--radius) - 4px)",
      },
      keyframes: {
        "accordion-down": {
          from: { height: 0 },
          to: { height: "var(--radix-accordion-content-height)" },
        },
        "accordion-up": {
          from: { height: "var(--radix-accordion-content-height)" },
          to: { height: 0 },
        },
        "fade-up": {
          "0%": {
            opacity: 0,
            transform: "translateY(10px)",
          },
          "80%": {
            opacity: 0.6,
          },
          "100%": {
            opacity: 1,
            transform: "translateY(0px)",
          },
        },
        "fade-down": {
          "0%": {
            opacity: 0,
            transform: "translateY(-10px)",
          },
          "80%": {
            opacity: 0.6,
          },
          "100%": {
            opacity: 1,
            transform: "translateY(0px)",
          },
        },
        // Tooltip
        "slide-up-fade": {
          "0%": { opacity: 0, transform: "translateY(6px)" },
          "100%": { opacity: 1, transform: "translateY(0)" },
        },
        "slide-down-fade": {
          "0%": { opacity: 0, transform: "translateY(-6px)" },
          "100%": { opacity: 1, transform: "translateY(0)" },
        },
      },
      animation: {
        // Fade up and down
        "fade-up": "fade-up 0.5s",
        "fade-down": "fade-down 0.5s",
        // Tooltip
        "slide-up-fade": "slide-up-fade 0.3s cubic-bezier(0.16, 1, 0.3, 1)",
        "slide-down-fade": "slide-down-fade 0.3s cubic-bezier(0.16, 1, 0.3, 1)",
        "accordion-down": "accordion-down 0.2s ease-out",
        "accordion-up": "accordion-up 0.2s ease-out",
      },
    },
  },
  plugins: [
    require("tailwindcss-animate"),
    require("@tailwindcss/forms"),
    require("@tailwindcss/typography"),
    plugin(({ addVariant }) => {
      addVariant("radix-side-top", '&[data-side="top"]')
      addVariant("radix-side-bottom", '&[data-side="bottom"]')
    }),
  ],
}

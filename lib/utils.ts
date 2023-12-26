import { type ClassValue, clsx } from "clsx"
import { twMerge } from "tailwind-merge"
import ms from "ms"

export const componentToHTML = async (component) => {
  const ReactDOMServer = (await import("react-dom/server")).default
  const staticMarkup = ReactDOMServer.renderToStaticMarkup(component)
  return staticMarkup
}

export function cn(...inputs: ClassValue[]) {
  return twMerge(clsx(inputs))
}

export const timeAgo = (timestamp: Date, timeOnly?: boolean): string => {
  if (!timestamp) return "never"
  return `${ms(Date.now() - new Date(timestamp).getTime())}${
    timeOnly ? "" : " ago"
  }`
}

export async function fetcher<JSON = any>(
  input: RequestInfo,
  init?: RequestInit,
): Promise<JSON> {
  const res = await fetch(input, init)

  if (!res.ok) {
    const json = await res.json()
    if (json.error) {
      const error = new Error(json.error) as Error & {
        status: number
      }
      error.status = res.status
      throw error
    } else {
      throw new Error("An unexpected error occurred")
    }
  }

  return res.json()
}

export function nFormatter(num: number, digits?: number) {
  if (!num) return "0"
  const lookup = [
    { value: 1, symbol: "" },
    { value: 1e3, symbol: "K" },
    { value: 1e6, symbol: "M" },
    { value: 1e9, symbol: "G" },
    { value: 1e12, symbol: "T" },
    { value: 1e15, symbol: "P" },
    { value: 1e18, symbol: "E" },
  ]
  const rx = /\.0+$|(\.[0-9]*[1-9])0+$/
  var item = lookup
    .slice()
    .reverse()
    .find(function (item) {
      return num >= item.value
    })
  return item
    ? (num / item.value).toFixed(digits || 1).replace(rx, "$1") + item.symbol
    : "0"
}

export function capitalize(str: string) {
  if (!str || typeof str !== "string") return str
  return str.charAt(0).toUpperCase() + str.slice(1)
}

export const truncate = (str: string, length: number) => {
  if (!str || str.length <= length) return str
  return `${str.slice(0, length)}...`
}

export const sliderResponseToText = (response: string): string => {
  switch (response) {
    case "1":
      return "Trifft nicht zu"
    case "2":
      return "Eher nicht"
    case "3":
      return "Egal"
    case "4":
      return "Wäre gut"
    case "5":
      return "Trifft zu"
    default:
      return "Egal"
  }
}

export const salaryFormatter = (salary: number): string => {
  const formatter = new Intl.NumberFormat("de-DE", {
    minimumFractionDigits: 0,
  })
  return formatter.format(salary)
}

export const convertMinsToHrsMins = (n: number) => {
  const hours = Math.trunc(n / 60)
  const minutes = n % 60

  if (hours > 0 && minutes > 0) {
    return `${hours}h ${minutes}min`
  } else if (hours > 0) {
    return `${hours}h`
  }

  return `${minutes}min`
}

export function getImageFullUrl(id: string) {
  return `/api/files/${id}`
}

export function formatArray(arr: string[]): string {
  if (!arr || !arr.length) return ""
  if (!Array.isArray(arr)) return arr
  // capitalize first letter
  arr = arr.map((str) => capitalize(str))
  return `${arr.join(", ")}`
}

export function formatDateString(d: Date): string {
  if (!d) return ""
  return `${d.getDate()}.${d.getMonth() + 1}.${d.getFullYear()}`
}

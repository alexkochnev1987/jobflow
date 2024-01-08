export const main = {
  backgroundColor: "#f6f9fc",
  fontFamily:
    '-apple-system,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Ubuntu,sans-serif',
}

export const container = {
  backgroundColor: "#ffffff",
  margin: "0 auto",
  marginBottom: "64px",
  padding: "20px 0 48px",
}

export const box = {
  padding: "0 48px",
}

export const hr = {
  borderColor: "#e6ebf1",
  margin: "20px 0",
}

export const paragraph = {
  color: "#000",
  fontSize: "16px",
  lineHeight: "24px",
  textAlign: "left" as const,
}

export const anchor = {
  color: "#000",
  textDecoration: "underline",
  fontWeight: "bold",
}

export const button = {
  backgroundColor: "#777",
  borderRadius: "5px",
  color: "#fff",
  display: "block",
  fontSize: "16px",
  fontWeight: "bold",
  textAlign: "center" as const,
  textDecoration: "none",
  width: "100%",
  padding: "10px",
}

export const heading = {
  fontSize: "32px",
  fontWeight: "bold",
  lineHeight: "32px",
  textAlign: "left" as const,
}

export const disclaimer = {
  ...paragraph,
  fontSize: "8px",
}

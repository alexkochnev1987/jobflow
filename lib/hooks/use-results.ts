"use client"
import { userStore } from "@/app/client/store"
import { useEffect, useState } from "react"

export function useResults() {
    const {id} = userStore()
    const [isLoading, setIsLoading] = useState(true)
    const [results, setResults] = useState(null)

    console.log(id)
    
    useEffect(() => {
        setIsLoading(true)
        fetch("/api/results", {
            method: "POST",
            headers: {
              "Content-Type": "application/json",
            },
            body: JSON.stringify({ uid: id}),
          }).then(r => {
            r.json()
            .then(b => setResults(b))
            .finally( () => setIsLoading(false))
            
          }).catch(() => {
            setIsLoading(false)
          })
    }, [id])

    return {
        isLoading,
        results
    }
  }
  
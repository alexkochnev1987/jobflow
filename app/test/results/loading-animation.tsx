"use client"
import { useEffect, useRef, useState } from "react"

export default function LoadingAnimation() {
  const documentRef = useRef<HTMLCanvasElement>()
  const [points] = useState([])
  const [context, setContext] = useState(null)
  const [velocity2] = useState(5)
  const [radius] = useState(5)
  const [boundaryX] = useState(200)
  const [boundaryY] = useState(200)
  const [numberOfPoints] = useState(30)

  useEffect(() => {
    function createPoint() {
      const point: {
        x: number
        y: number
        vx?: number
        vx2?: number
        vy?: number
      } = { x: 0, y: 0 }
      let vx2 = null
      let vy2 = null
      point.x = Math.random() * boundaryX
      point.y = Math.random() * boundaryY
      // random vx
      point.vx = (Math.floor(Math.random()) * 2 - 1) * Math.random()
      vx2 = Math.pow(point.vx, 2)
      // vy^2 = velocity^2 - vx^2
      vy2 = velocity2 - vx2
      point.vy = Math.sqrt(vy2) * (Math.random() * 2 - 1)
      points.push(point)
    }

    function resetVelocity(point, axis, dir) {
      let vx = null
      let vy = null
      let vx2 = null
      let vy2 = null
      if (axis == "x") {
        point.vx = dir * Math.random()
        vx2 = Math.pow(point.vx, 2)
        // vy^2 = velocity^2 - vx^2
        vy2 = velocity2 - vx2
        point.vy = Math.sqrt(vy2) * (Math.random() * 2 - 1)
      } else {
        point.vy = dir * Math.random()
        vy2 = Math.pow(point.vy, 2)
        // vy^2 = velocity^2 - vx^2
        vx2 = velocity2 - vy2
        point.vx = Math.sqrt(vx2) * (Math.random() * 2 - 1)
      }
    }

    function drawCircle(x, y) {
      context.beginPath()
      context.arc(x, y, radius, 0, 2 * Math.PI, false)
      context.fillStyle = "#97badc"
      context.fill()
    }

    function drawLine(x1, y1, x2, y2) {
      context.beginPath()
      context.moveTo(x1, y1)
      context.lineTo(x2, y2)
      context.strokeStyle = "#8ab2d8"
      context.stroke()
    }

    function draw() {
      for (var i = 0, l = points.length; i < l; i++) {
        // circles
        var point = points[i]
        point.x += point.vx
        point.y += point.vy
        drawCircle(point.x, point.y)
        // lines
        drawLine(point.x, point.y, point.buddy.x, point.buddy.y)
        // check for edge
        if (point.x < 0 + radius) {
          resetVelocity(point, "x", 1)
        } else if (point.x > boundaryX - radius) {
          resetVelocity(point, "x", -1)
        } else if (point.y < 0 + radius) {
          resetVelocity(point, "y", 1)
        } else if (point.y > boundaryY - radius) {
          resetVelocity(point, "y", -1)
        }
      }
    }

    function animate() {
      if (!context) return
      context.clearRect(0, 0, 200, 200)
      draw()
      requestAnimationFrame(animate)
    }
    function init() {
      // create points
      for (var i = 0; i < numberOfPoints; i++) {
        createPoint()
      }
      // create connections
      for (var i = 0, l = points.length; i < l; i++) {
        var point = points[i]
        if (i == 0) {
          points[i].buddy = points[points.length - 1]
        } else {
          points[i].buddy = points[i - 1]
        }
      }

      // animate
      animate()
    }
    setContext(documentRef.current.getContext("2d"))

    init()
  }, [
    documentRef,
    context,
    numberOfPoints,
    points,
    boundaryX,
    boundaryY,
    radius,
    velocity2,
  ])

  return (
    <canvas
      width="200"
      height="200"
      ref={documentRef}
      style={{
        position: "absolute",
        width: 200,
        height: 200,
        margin: "auto",
        transform: "rotate(45deg)",
        top: 0,
        bottom: 0,
        left: 0,
        right: 0,
      }}
    ></canvas>
  )
}

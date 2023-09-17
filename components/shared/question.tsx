import { Button } from "../ui/button"
import { Label } from "../ui/label"
import { Textarea } from "../ui/textarea"
import { Progress } from "../ui/progress"
import {
  Card,
  CardContent,
  CardDescription,
  CardFooter,
  CardHeader,
  CardTitle,
} from "../ui/card"
import { Slider } from "../ui/slider"
import { Skeleton } from "../ui/skeleton"
import { RadioGroup, RadioGroupItem } from "../ui/radio-group"

export default function Question() {
  return (
    <>
      <Card>
        <CardHeader>
          <CardTitle className="text-right">
            <Progress value={20} />
          </CardTitle>
          <CardDescription className="text-lg">Persönliche Werte</CardDescription>
        </CardHeader>
        <CardContent className="flex flex-col gap-3">
          <p>
            Unsere Werte sind tief verwurzelte Überzeugungen und Prinzipien, die
            das Verhalten und die Entscheidungen einer Person leiten. Es ist
            wichtig, sie zu kennen, da sie als innerer Kompass dienen und
            helfen, authentische Entscheidungen zu treffen, die mit den eigenen
            Überzeugungen und Zielen in Einklang stehen.
          </p>
          <Label htmlFor="email">
            Wenn du eine Sache auf der Welt ändern könntest, was wäre das?
          </Label>
          <Textarea placeholder="Deine Antwort" id="message" />
          <Slider defaultValue={[1]} max={5} step={1} />
          <Skeleton className="h-[20px] w-full rounded-full" />

          <RadioGroup defaultValue="option-one" className="flex flex-row">
            <div className="flex items-center space-x-2">
              <RadioGroupItem value="option-one" id="option-one" />
              <Label htmlFor="option-one">Option One</Label>
            </div>
            <div className="flex items-center space-x-2">
              <RadioGroupItem value="option-two" id="option-two" />
              <Label htmlFor="option-two">Option Two</Label>
            </div>
          </RadioGroup>
        </CardContent>
        <CardFooter className="flex flex-row justify-center gap-3">
          <Button variant="outline" size="lg">
            Zurück
          </Button>
          <Button size="lg">Weiter</Button>
        </CardFooter>
      </Card>
    </>
  )
}

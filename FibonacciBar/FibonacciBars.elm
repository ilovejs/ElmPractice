module FibonacciBars where

import Color exposing (blue, brown, green, orange, purple, red, yellow)
import Fibonacci exposing (fibonacci, fibonacciWithIndexes)
import Graphics.Collage exposing (collage, filled, rect)
import Graphics.Element exposing (down, flow, right)
import List exposing (drop, head, length, map)
import Text exposing (asText)

--grab the n-th color
color n =
    let colors = [ red, orange, yellow, green, blue, purple, brown ]
    in
        drop (n % (length colors)) colors |> head


bar (index, n) =
    flow right [
        collage (n*20) 20 [ filled (color index) (rect (toFloat n * 20) 20) ],
        asText n
    ]


main = flow down <| map bar (fibonacciWithIndexes 10)

{--

rect : Float -> Float -> Shape

filled : Color -> Shape -> Form

collage : Int -> Int -> List Form -> Element

flow : Direction -> List Element -> Element
The Direction parameter represents 
the direction of how the elements from the list are placed in relation to each other. 

asText : a -> Element

--}
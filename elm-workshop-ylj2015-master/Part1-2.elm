import Graphics.Element exposing (..)
import Time
import Window
import Color exposing (..)
import Graphics.Collage exposing (..)
import Graphics.Element exposing (..)
import Keyboard
import Text exposing (monospace, fromString)
import Time exposing (..)
import Window
import Signal exposing ((<~), (~), foldp, sampleOn)
import Debug exposing (log)

type H = H

delta : Signal Time
delta = inSeconds <~ fps 35

-- Let's thing a little about the game inputs

type Direction   = Up | Stopped | Down
type alias Input = {paddle1:Direction, paddle2:Direction, delta:Time }

dirToInt : Direction -> Int
dirToInt dir =
    case dir of
      Up       -> 1
      Stopped  -> 0
      Down     -> -1

intToDir : Int -> Direction
intToDir x =
    if | x == 1    -> Up
       | x == (-1) -> Down
       | otherwise -> Stopped



-- Exercise 1.1
-- Consider the following signal
--
keysOverTime : Signal ({ x : Int, y : Int }, { x : Int, y : Int })
keysOverTime = sampleOn delta <| Signal.map2 (,) Keyboard.wasd Keyboard.arrows

-- main : Signal Element
-- main = Signal.map show keysOverTime

--
-- It represents the input signals over time, which is useful but as hinted by our helper functions
-- it would be best to turn these objects in Directions so we don't have to remember what 1 or -1 means.
--
-- Write another signal `paddlesOverTime` which does exactly that

recordToDir : { x : Int, y : Int } -> Direction
recordToDir = H


paddlesOverTime : Signal (Direction, Direction)
paddlesOverTime = sampleOn delta <| H

main : Signal Element
main = Signal.map show paddlesOverTime

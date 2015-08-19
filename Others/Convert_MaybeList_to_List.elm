import List exposing (head, tail)
import Graphics.Element exposing (down, flow, right, leftAligned, show)
import Text exposing (fromString)

(>=>) : (Maybe b) -> (b -> Maybe c) -> (a -> Maybe c)
f >=> g = 
    f >> Maybe.andThen g

{--
head : List a -> Maybe a
tail : List a -> Maybe (List a)
--}

--second : List Int -> Int
--second xs =
--  let maybeTail = (tail xs)
--  in
--    case maybeTail of
--      Maybe k -> head k
--      Nothing -> 0

main = flow down [
            show ((tail >=> head) [1,2,3,4,5])
       ] 
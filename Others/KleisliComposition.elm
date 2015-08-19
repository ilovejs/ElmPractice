import List exposing (head, tail)
import Graphics.Element exposing (show)

(>=>) : (a -> Maybe b) -> (b -> Maybe c) -> (a -> Maybe c)
--f >=> g = 
--    \a -> case f a of 
--        Nothing -> Nothing
--        Just b  -> g b

--f >=> g = f >> Maybe.andThen g

main = show ((tail >=> head) [1,2,3,4,5])
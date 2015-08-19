--in repl, you can do: 

-- > round
--   <function: round> : Float -> Int

--toFloat x

-- > y = 4
-- 4 : number, this means elm compiler haven't decide which type, it's not  in capital letter.

--> (/)
--    <function> : Float -> Float -> Float
--> (//)
--    <function> : Int -> Int -> Int 
module Fibonacci where

import List exposing ((::), head, map2, reverse, tail)

fibonacci : Int -> List Int
fibonacci n =
    let fibonacci' n acc =
        if n <= 2
            then acc
            else fibonacci' (n-1) ((head acc + (tail >> head) acc) :: acc)
    in
        fibonacci' n [1,1] |> reverse

{--
head : List a -> Maybe a
tail : List a -> Maybe (List a)
--}
second : List a -> a
second xs =
  let maybeHead = (head xs)
  in
    case maybeHead of
      Just x  -> x
      Nothing -> 0
    

{--
The f (g x) expression is equivalent to both (g >> f) x and (f << g) x — both operators are equivalent, 
except for the order of arguments.

head (tail [1,2,3,4]) is same as (head << tail) [1,2,3,4]
--}


fibonacciWithIndexes : Int -> List(Int, Int)
fibonacciWithIndexes n = map2 (,) [0..n] (fibonacci n)
{-- 
  1. Get the nth fibonacci number tuple
  > fibonacciWithIndexes 10
  [(0,1),(1,1),(2,2),(3,3),(4,5),(5,8),(6,13),(7,21),(8,34),(9,55)] : [(Int, Int)]

  
  2. (,), (,,) and (,,,) are actually functions returning tuples.

  > (,)
  <function> : a -> b -> ( a, b )
  > (,,)
  <function> : a -> b -> c -> ( a, b, c )
  > (,,,)
  <function> : a -> b -> c -> d -> ( a, b, c, d )

  3. The map2 function takes a two-argument function and two lists, 
     and returns a list of values calculated by applying the function to consecutive elements of both lists, 
     skipping the excessive elements of the longer list.

  > map2 (+) [9,8,7,6,5] [4,4,7,7]
  [13,12,14,13] : List number

  > map2 (,) [9,8,7,6,5] [4,4,7,7]
  [(9,4),(8,4),(7,7),(6,7)] : List ( number, number )

    
--}
--See output value on: 
  --http://elm-lang.org/examples/binary-tree

{-----------------------------------------------------------------

A "Tree" represents a binary tree. A "Node" in a binary tree
always has two children. A tree can also be "Empty". Below I have
defined "Tree" and a number of useful functions.

This example also includes some challenge problems :)

-----------------------------------------------------------------}

import Graphics.Element exposing (..)
import Text


type Tree a
    = Empty
    | Node a (Tree a) (Tree a)


empty : Tree a
empty =
    Empty


singleton : a -> Tree a
singleton v =
    Node v Empty Empty

--TODO: what is comparable type ?
insert : comparable -> Tree comparable -> Tree comparable
insert x tree =
    case tree of
      Empty ->
          singleton x

      Node y left right ->
          -- Operator can works on comparable data type.
          if  | x > y -> Node y left (insert x right)
              | x < y -> Node y (insert x left) right
              | otherwise -> tree


fromList : List comparable -> Tree comparable
--left fold on a list (xs), start from empty
fromList xs =
    List.foldl insert empty xs


depth : Tree a -> Int
depth tree =
    case tree of
      Empty -> 0
      Node v left right ->
          --max, Wuhu ~~
          1 + max (depth left) (depth right)

--Question: does type annotation helps ?
map : (a -> b) -> Tree a -> Tree b
map f tree =
    --Elm's style of pattern match
    case tree of
      Empty -> Empty
      Node v left right ->
          Node (f v) (map f left) (map f right)

--////////////////////////////////////////////////////////////////////////////////

t1 = fromList [1,2,3]
 --1
 -- \ 
 --  2
 --   \
 --    3

t2 = fromList [2,1,3]
 --  2
 -- / \
 --1   3

main : Element
main =
    flow down
        [ display "depth" depth t1
        , display "depth" depth t2
        , display "map ((+)1)" (map ((+)1)) t2    --(map ((+)1)) is a function.
        ]

--argument: value has 'Tree a' type
display : String -> (Tree a -> b) -> Tree a -> Element
display name f value =
    name ++ " (" ++ toString value ++ ") &rArr;\n    " ++ toString (f value) ++ "\n "
        |> Text.fromString
        |> Text.monospace
        |> leftAligned


{--
Exercises:

(1) Sum all of the elements of a tree.

       sum : Tree Number -> Number
--}

sum : Tree Number -> Number
sum tree =
  case tree of
    Empty -> 0
    Node v left right ->
        v + (sum left) + (sum right)

{--
(2) Flatten a tree into a list.

       flatten : Tree a -> List a
--}
flatten : Tree a -> List a
flatten tree =
  case tree of
    Empty -> []
    Node v left right ->
        v ++ (flatten left) ++ (flatten right)

{--
(3) Check to see if an element is in a given tree.

       isElement : a -> Tree a -> Bool
--}
isElement : a -> Tree a -> Bool
isElement target tree = 
  case tree of 
    Empty -> False
    Node v left right ->
        if target == v 
          then True
          else (isElement v left) || (isElement v right)

{--
(4) Write a general fold function that acts on trees. The fold
    function does not need to guarantee a particular order of
    traversal.

       fold : (a -> b -> b) -> b -> Tree a -> b
--}
fold : (a -> b -> b) -> b -> Tree a -> b

{--
(5) Use "fold" to do exercises 1-3 in one line each. The best
    readable versions I have come up have the following length
    in characters including spaces and function name:
      sum: 16
      flatten: 21
      isElement: 46
    See if you can match or beat me! Don't forget about currying
    and partial application!

(6) Can "fold" be used to implement "map" or "depth"?

(7) Try experimenting with different ways to traverse a
    tree: pre-order, in-order, post-order, depth-first, etc.
    More info at: http://en.wikipedia.org/wiki/Tree_traversal

-----------------------------------------------------------------}







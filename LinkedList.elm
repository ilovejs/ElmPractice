type List a = Empty | Node a (List a)

--Empty
--Node 1 Empty
--Node 3 (Node 2 (Node 1 Empty))

sum : List Int -> Int
sum xs =
    case xs of
      Empty ->
          0

      Node first rest ->
          first + sum rest


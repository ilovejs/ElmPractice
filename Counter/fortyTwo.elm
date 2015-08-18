fortyTwo : Int
fortyTwo = 
    42

names : List String
names =
    ["alice", "bob", "chunk"]

book : { title: String, author: String, pages: Int }
book =
    { title = "Demian", author = "Hesse", pages = 176 }

import List exposing (sum, map, length)

--input is list of string
averageNameLength : List String -> Float
averageNameLength names =
    sum (map String.length names) / length names

--record holds a field name 'pages'
isLong : { record | pages : Int } -> Bool
isLong book =
    book.pages > 400


--Enumerations
type Visibility = All | Active | Completed

toString : Visibility -> String
--case expression
toString visibility =
    case visibility of
      All ->
          "All"

      Active ->
          "Active"

      Completed ->
          "Completed"


-- toString All == "All"
-- toString Active == "Active"
-- toString Completed == "Completed"


--State machine:
--toggled between anonymous and logged in with a user name
type User = Anonymous | LoggedIn String

activeUsers : List User
activeUsers =
    [ Anonymous
    , LoggedIn "Tom"
    , LoggedIn "Steve"
    , Anonymous
    ]


userPhoto : User -> String
userPhoto user =
    case user of
      Anonymous ->
          "anon.png"

      LoggedIn name ->
          "users/" ++ name ++ "/photo.png"


photos =
    List.map userPhoto activeUsers

-- photos =
--     [ "anon.png"
--     , "users/Tom/photo.png"
--     , "users/Steve/photo.png"
--     , "anon.png"
--     ]






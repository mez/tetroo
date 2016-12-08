module Block exposing (..)

import Html exposing (Html, text)
import Color exposing (Color)
import Collage exposing (group, solid, outlined, square, filled, Form, collage)
import Element exposing (toHtml)


size : Int
size =
    25


type alias Block =
    { color : Color
    }


toForm : Block -> Form
toForm block =
    let
        shape =
            square (toFloat size)

        border =
            outlined (solid Color.black) shape
    in
        group [ filled block.color shape, border ]


main : Html msg
main =
    toHtml <| collage 400 400 [ toForm (Block Color.lightBlue) ]

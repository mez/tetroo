module Tetromino exposing (..)

import Html exposing (Html, text)
import Collage exposing (move, group, Form, collage)
import Element exposing (toHtml)
import List
import Block exposing (Block)
import Color exposing (Color)


type alias Location =
    ( Int, Int )


type alias Tetromino =
    { shape : List Location
    , block : Block
    }


toForm : Tetromino -> Form
toForm { shape, block } =
    let
        form =
            Block.toForm block

        translate ( row, col ) =
            move ( toFloat (col * Block.size), toFloat (row * Block.size) ) form

        forms =
            List.map translate shape
    in
        group forms


i : Tetromino
i =
    { shape =
        [ ( 1, 0 )
        , ( 0, 0 )
        , ( -1, 0 )
        , ( -2, 0 )
        ]
    , block = Block Color.lightBlue
    }


j : Tetromino
j =
    { shape =
        [ ( 1, 0 )
        , ( 0, 0 )
        , ( -1, 0 )
        , ( -1, -1 )
        ]
    , block = Block Color.blue
    }


l : Tetromino
l =
    { shape =
        [ ( 1, 0 )
        , ( 0, 0 )
        , ( -1, 0 )
        , ( -1, 1 )
        ]
    , block = Block Color.blue
    }


o : Tetromino
o =
    { shape =
        [ ( 1, 0 )
        , ( 0, 0 )
        , ( 1, 1 )
        , ( 0, 1 )
        ]
    , block = Block Color.lightYellow
    }


t : Tetromino
t =
    { shape =
        [ ( 1, 0 )
        , ( 0, 0 )
        , ( 0, -1 )
        , ( 0, 1 )
        ]
    , block = Block Color.lightPurple
    }


z : Tetromino
z =
    { shape =
        [ ( 1, 0 )
        , ( 1, 1 )
        , ( 0, 1 )
        , ( 0, 2 )
        ]
    , block = Block Color.lightRed
    }


s : Tetromino
s =
    { shape =
        [ ( 1, 2 )
        , ( 1, 1 )
        , ( 0, 1 )
        , ( 0, 0 )
        ]
    , block = Block Color.lightGreen
    }


tetromino =
    s


main : Html msg
main =
    toHtml <| collage 400 400 [ toForm tetromino ]

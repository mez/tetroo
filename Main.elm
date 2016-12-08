module Main exposing (..)

import Html exposing (Html, div, text)
import Html.Attributes exposing (class, style)
import AnimationFrame
import Time exposing (Time)


-- import Collage

import Color exposing (..)
import Collage exposing (..)
import Element exposing (..)


(=>) : a -> b -> ( a, b )
(=>) =
    (,)



-- Model


type alias Model =
    { currentShape : Form
    }


initModel : ( Model, Cmd Msg )
initModel =
    ( Model l, Cmd.none )



-- Message


type Msg
    = NoOp
    | Tick Time



-- Update


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Tick time ->
            let
                rotatedShape =
                    rotate (2 * pi / 100) model.currentShape
            in
                ( { model | currentShape = rotatedShape }, Cmd.none )

        _ ->
            ( model, Cmd.none )



-- View


clearGrey : Color
clearGrey =
    rgba 111 111 111 0.6


view : Model -> Html Msg
view model =
    div []
        [ renderGridZone model
        ]


l : Form
l =
    group
        [ square 20 |> filled clearGrey
        , square 20 |> filled clearGrey |> moveX 20
        , square 20 |> filled clearGrey |> move ( 20, 20 )
        , square 20 |> filled clearGrey |> move ( 20, 40 )
        ]


renderGridZone : Model -> Html Msg
renderGridZone model =
    div
        [ style
            [ "border" => "1px solid black"
            , "width" => "300px"
            , "heigth" => "600px"
            , "margin-top" => "150px"
            , "margin-left" => "150px"
            ]
        ]
        [ toHtml <|
            collage 300
                600
                [ model.currentShape ]
        ]



-- subscriptions


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.batch
        [ AnimationFrame.diffs Tick
        ]


main : Program Never Model Msg
main =
    Html.program
        { init = initModel
        , view = view
        , update = update
        , subscriptions = subscriptions
        }

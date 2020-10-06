module Main exposing (..)

import Browser
import Html exposing (Html, Attribute, div, input, text, br, img)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)

main =
  Browser.sandbox { init = init, update = update, view = view }

type alias Model =
  { content : String }

init : Model
init =
  { content = "" }

type Msg
  = Change String

update : Msg -> Model -> Model
update msg model =
  case msg of
    Change newContent ->
      { model | content = newContent }

view : Model -> Html Msg
view model =
  div 
  [ style "text-align" "center"
  , style "margin-top" "3cm"
  ]
    [ img 
    [src "https://seeklogo.com/images/E/elm-logo-F53279638B-seeklogo.com.png", style "margin-bottom" "20px"] []
    , br [] []
    , input [ style "text-align" "center"
            , style "margin-top" "1cm"
            , placeholder "Text to reverse", value model.content, onInput Change ] []
    , div 
    [ style "text-align" "center"
    , style "font-family" "Arial"
    , style "margin-top" "2cm"
    ] 
    [ text (String.reverse model.content) ]
    ]
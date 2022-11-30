module Main exposing (main)


import Browser
import Data
import Html exposing (Html)
import Expression
import Html.Attributes

main =
    Browser.element
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


type alias Model =
    { sourceText : String
    }


type Msg
    = NoOp



type alias Flags =
    {}



initialText =
    Data.initialText



init : Flags -> ( Model, Cmd Msg )
init flags =
    ( { sourceText = initialText
      }
    , Cmd.none
    )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )


view : Model -> Html Msg
view model =
    Html.p []
      [Expression.compile model.sourceText]


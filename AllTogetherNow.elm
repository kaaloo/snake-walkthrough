import Color exposing (..)
import Graphics.Collage exposing (..)
import Graphics.Element exposing (..)
import Keyboard
import List
import Random exposing (..)
import Signal exposing (..)
import Text
import Window

-- Model

type Direction = Up | Down | Left | Right

type alias Snake =
  { segments: List(Float, Float)
  , direction:Direction
  }

type alias Cherry = Maybe (Float, Float)

type Model = NotStarted | Started (Snake, Cherry, Seed)

segmentDim = 15.0
cherryRadius = 7.5
initSeed = Random.initialSeed 42

defaultSnake : Snake
defaultSnake =
    { segments =
        [0.0..8.0]
        |> List.map (\n -> (n*segmentDim, 0))
        |> List.reverse
    , direction = Right
    }

initialModel : Model
initialModel = NotStarted

-- Signals

type Action = Arrow
               { x:Int
               , y:Int
               }
            | Space Bool

arrows : Signal Action
arrows = Arrow <~ Keyboard.arrows

spaces : Signal Action
spaces = Space <~ Keyboard.space

actions : Signal Action
actions = merge arrows spaces

type WindowSize = Dimensions {width: Int, height: Int}

dim2ws : (Int, Int) -> WindowSize
dim2ws (w, h) = Dimensions {width = w, height = h}

windowSize : Signal WindowSize
windowSize = map dim2ws Window.dimensions

-- Update

update : Action -> Model -> Model
update action model =
  case action of
    Arrow {x, y} ->
      case model of
        NotStarted -> model
        Started _ -> model
    Space pressed ->
      case model of
        NotStarted -> Started (defaultSnake, Nothing, initSeed)
        Started _ -> model

-- View

txt msg =
    msg
    |> Text.fromString
    |> Text.color white
    |> Text.monospace
    |> leftAligned
    |> toForm

display : WindowSize -> Model -> Element
display (Dimensions ws) model =
      let background = rect (toFloat ws.width) (toFloat ws.height) |> filled black
          content = [txt "press SPACE to start"]
      in collage ws.width ws.height (background::content)

-- Main

gameState : Signal Model
gameState = Signal.foldp update initialModel actions

main : Signal Element
main = display <~ windowSize ~ gameState

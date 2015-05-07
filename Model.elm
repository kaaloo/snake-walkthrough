module Model where

import List exposing (..)
import Random exposing (..)

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
        |> map (\n -> (n*segmentDim, 0))
        |> reverse
    , direction = Right
    }

initialModel : Model
initialModel = NotStarted

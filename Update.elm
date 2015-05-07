module Update where

import Model exposing (..)
import Signals exposing (..)

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

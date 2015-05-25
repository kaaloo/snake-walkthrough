module SnakeModular where

import Graphics.Element exposing (..)
import Model exposing (..)
import Signal exposing (..)
import Signals exposing (..)
import Time
import Update exposing (..)
import View exposing (..)

delta : Signal Float
delta = Time.fps 20

input : Signal (WindowSize, Action)
input = Signal.sampleOn delta ((,) <~ windowSize ~ actions)

model : Signal Model
model = Signal.foldp update initialModel input

main : Signal Element
main = display <~ windowSize ~ model

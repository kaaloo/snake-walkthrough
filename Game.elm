module Game where

import Graphics.Element exposing (..)
import Model exposing (..)
import Signal exposing (..)
import Signals exposing (..)
import View exposing (..)
import Update exposing (..)

gameState : Signal Model
gameState = Signal.foldp update initialModel actions

main : Signal Element
main = display <~ windowSize ~ gameState

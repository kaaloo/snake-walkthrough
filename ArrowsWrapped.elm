module ArrowsWrapped where

import Graphics.Element exposing (..)
import Keyboard
import Signal exposing (..)

type Action = Arrow {x:Int, y:Int}

arrows : Signal Action
arrows = Arrow <~ Keyboard.arrows

main : Signal Element
main = map show arrows

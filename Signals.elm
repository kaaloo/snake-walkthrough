module Signals where

import Graphics.Element exposing (..)
import Keyboard
import Signal exposing (..)
import Window

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

main : Signal Element
main = map show actions

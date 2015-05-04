module Actions where

import Graphics.Element exposing (..)
import Keyboard
import Signal exposing (..)
import Window

type Action = Arrow
               { x:Int
               , y:Int
               }
           | WindowSize
               { width: Int
               , height: Int
               }
           | Space Bool

arrows : Signal Action
arrows = Arrow <~ Keyboard.arrows

spaces : Signal Action
spaces = Space <~ Keyboard.space

dim2ws : (Int, Int) -> Action
dim2ws (w, h) = WindowSize {width = w, height = h}

windowSize : Signal Action
windowSize = map dim2ws Window.dimensions

input : Signal Action
input = mergeMany [arrows, spaces, windowSize]

main : Signal Element
main = map show input

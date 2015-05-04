import Graphics.Element exposing (..)
import Keyboard
import Signal exposing (..)
import Window

type Event = Arrow
               { x:Int
               , y:Int
               }
           | WindowSize
               { width: Int
               , height: Int
               }
           | Space Bool

arrows : Signal Event
arrows = Arrow <~ Keyboard.arrows

spaces : Signal Event
spaces = Space <~ Keyboard.space

dim2ws : (Int, Int) -> Event
dim2ws (w, h) = WindowSize {width = w, height = h}

windowSize : Signal Event
windowSize = map dim2ws Window.dimensions

input : Signal Event
input = mergeMany [arrows, spaces, windowSize]

main : Signal Element
main = map show input

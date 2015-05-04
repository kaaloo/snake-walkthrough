import Graphics.Element exposing (..)
import Keyboard
import Signal exposing (..)

type Event = Arrow {x:Int, y:Int}

arrows : Signal Event
arrows = Arrow <~ Keyboard.arrows

main : Signal Element
main = map show arrows

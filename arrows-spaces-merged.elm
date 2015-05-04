import Graphics.Element exposing (..)
import Keyboard
import Signal exposing (..)

type Event = Arrow {x:Int, y:Int} | Space Bool

arrows : Signal Event
arrows = Arrow <~ Keyboard.arrows

spaces : Signal Event
spaces = map (\pressed -> Space pressed) Keyboard.space

input : Signal Event
input = merge arrows spaces

main : Signal Element
main = map show input

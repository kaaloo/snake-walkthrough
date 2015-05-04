import Graphics.Element exposing (..)
import Keyboard
import Signal exposing (..)

type Action = Arrow {x:Int, y:Int} | Space Bool

arrows : Signal Action
arrows = Arrow <~ Keyboard.arrows

spaces : Signal Action
spaces = map (\pressed -> Space pressed) Keyboard.space

input : Signal Action
input = merge arrows spaces

main : Signal Element
main = map show input

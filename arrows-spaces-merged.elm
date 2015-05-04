import Graphics.Element exposing (..)
import Keyboard
import Signal exposing (..)

type UserInput = Arrow {x:Int, y:Int} | Space Bool

arrows : Signal UserInput
arrows = Arrow <~ Keyboard.arrows

spaces : Signal UserInput
spaces = map (\pressed -> Space pressed) Keyboard.space

input : Signal UserInput
input = merge arrows spaces

main : Signal Element
main = map show input

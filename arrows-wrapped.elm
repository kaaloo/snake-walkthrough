import Graphics.Element exposing (..)
import Keyboard
import Signal exposing (..)

type UserInput = Arrow {x:Int, y:Int}

arrows : Signal UserInput
arrows = Arrow <~ Keyboard.arrows

main = map show arrows

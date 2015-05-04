import Graphics.Element exposing (..)
import Keyboard
import Signal exposing (..)

type UserInput = Space Bool

spaces : Signal UserInput
spaces = map (\pressed -> Space pressed) Keyboard.space

main : Signal Element
main = map show spaces

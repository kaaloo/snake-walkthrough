import Graphics.Element exposing (..)
import Keyboard
import Signal exposing (..)

type UserInput = Space Bool

spaces = map (\pressed -> Space pressed) Keyboard.space

main = map show spaces

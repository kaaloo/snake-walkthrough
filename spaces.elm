import Graphics.Element exposing (..)
import Keyboard
import Signal exposing (..)

main : Signal Element
main = map show Keyboard.space

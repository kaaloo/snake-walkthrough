import Graphics.Element exposing (..)
import Keyboard
import Signal exposing (..)

type Event = Space Bool

spaces : Signal Event
spaces = Space <~ Keyboard.space

main : Signal Element
main = map show spaces

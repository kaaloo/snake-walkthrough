module SpacesWrapped where

import Graphics.Element exposing (..)
import Keyboard
import Signal exposing (..)

type Action = Space Bool

spaces : Signal Action
spaces = Space <~ Keyboard.space

main : Signal Element
main = map show spaces

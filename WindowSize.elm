module WindowSize where

import Graphics.Element exposing (..)
import Signal exposing (..)
import Window

main : Signal Element
main = map show Window.dimensions

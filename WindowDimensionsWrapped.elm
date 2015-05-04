module WindowDimensionsWrapped where

import Graphics.Element exposing (..)
import Signal exposing (..)
import Window

type Action = WindowSize {width: Int, height: Int}

dim2ws : (Int, Int) -> Action
dim2ws (w, h) = WindowSize {width = w, height = h}

windowSize : Signal Action
windowSize = map dim2ws Window.dimensions

main : Signal Element
main = map show windowSize

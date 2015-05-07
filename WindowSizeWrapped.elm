module WindowSizeWrapped where

import Graphics.Element exposing (..)
import Signal exposing (..)
import Window

type WindowSize = Dimensions {width: Int, height: Int}

dim2ws : (Int, Int) -> WindowSize
dim2ws (w, h) = Dimensions {width = w, height = h}

windowSize : Signal WindowSize
windowSize = map dim2ws Window.dimensions

main : Signal Element
main = map show windowSize

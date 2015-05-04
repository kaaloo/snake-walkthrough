import Graphics.Element exposing (..)
import Signal exposing (..)
import Window

type Event = WindowSize {width: Int, height: Int}

dim2ws : (Int, Int) -> Event
dim2ws (w, h) = WindowSize {width = w, height = h}

windowSize : Signal Event
windowSize = map dim2ws Window.dimensions

main : Signal Element
main = map show windowSize

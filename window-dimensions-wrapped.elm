import Graphics.Element exposing (..)
import Signal exposing (..)
import Window

type Event = WindowSize (Int, Int)

windowSize : Signal Event
windowSize = WindowSize <~ Window.dimensions

main : Signal Element
main = map show windowSize

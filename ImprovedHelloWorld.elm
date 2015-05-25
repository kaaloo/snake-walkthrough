import Graphics.Element exposing (..)
import Text

main : Element
main =
  leftAligned (Text.monospace (Text.fromString "Hello World!"))

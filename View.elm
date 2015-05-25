module View where

import Color exposing (..)
import Model exposing (..)
import Graphics.Collage exposing (..)
import Graphics.Element exposing (..)
import Signals exposing (..)
import Text

txt msg =
    msg
    |> Text.fromString
    |> Text.color white
    |> Text.monospace
    |> leftAligned
    |> toForm

display : WindowSize -> Model -> Element
display (Dimensions ws) model =
      let background = rect (toFloat ws.width) (toFloat ws.height) |> filled black
          content = case model of
            NotStarted -> [txt "press SPACE to start"]
            Started (snake, cherry, _) ->
                let segments =
                    snake.segments
                    |> List.map (\pos ->
                        rect segmentDim segmentDim
                        |> filled yellow
                        |> move pos)
                in case cherry of
                    Just pos ->
                        (circle cherryRadius
                         |> filled white
                         |> move pos)::segments
                    _ -> segments
      in collage ws.width ws.height (background::content)

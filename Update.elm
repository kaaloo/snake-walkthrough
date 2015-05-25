module Update where

import Model exposing (..)
import Signals exposing (..)
import Random

getNewDirection : { x:Int, y:Int } -> Direction -> Direction
getNewDirection { x, y } currentDir =
  if | x == 0  && y == 0              -> currentDir
     | x == -1 && currentDir == Right -> currentDir
     | x == 1  && currentDir == Left  -> currentDir
     | y == -1 && currentDir == Up    -> currentDir
     | y == 1  && currentDir == Down  -> currentDir
     | x == -1 -> Left
     | x == 1  -> Right
     | y == -1 -> Down
     | y == 1  -> Up

getNewSegment (Just (x, y)) direction =
  case direction of
    Up    -> (x, y+segmentDim)
    Down  -> (x, y-segmentDim)
    Left  -> (x-segmentDim, y)
    Right -> (x+segmentDim, y)

genRandoms n seed = Random.generate (Random.list n (Random.float 0 1)) seed

isOverlap (snakeX, snakeY) (cherryX, cherryY) =
  let (xd, yd) = (cherryX - snakeX, cherryY - snakeY)
      distance = sqrt(xd * xd + yd * yd)
  in distance <= (cherryRadius * 2)

spawnCherry (Dimensions {width, height}) randW randH =
    let x = randW * toFloat width - toFloat width/2
        y = randH * toFloat height - toFloat height/2
    in Just (x, y)

isGameOver (Dimensions {width, height}) newHead newTail =
    List.any (\t -> t == newHead) newTail -- eat itself
    || fst newHead > (toFloat width / 2)      -- hit bottom
    || snd newHead > (toFloat height / 2)      -- hit top
    || fst newHead < (toFloat -width / 2)     -- hit left
    || snd newHead < (toFloat -height / 2)     -- hit right

update : (WindowSize, Action) -> Model -> Model
update (windowDim, action) model =
  case action of
    Arrow ({x, y} as arrow) ->
      case model of
        NotStarted -> model
        Started ({segments, direction}, cherry, seed) ->
            let newDirection = getNewDirection arrow direction
                newHead = getNewSegment (List.head segments) newDirection
                ([spawn, randX, randY], newSeed) = genRandoms 3 seed
                ateCherry =
                    case cherry of
                        Nothing -> False
                        Just pos -> isOverlap newHead pos
                newCherry =
                    if ateCherry then Nothing
                    else
                        if cherry == Nothing && spawn <= 0.1
                        then spawnCherry windowDim randX randY
                        else cherry
                newTail =
                    if ateCherry
                    then segments
                    else List.take (List.length segments-1) segments
                gameOver = isGameOver windowDim newHead newTail
            in if gameOver then NotStarted
               else Started ({segments=newHead::newTail, direction=newDirection}, newCherry, newSeed)
    Space pressed ->
      case model of
        NotStarted ->
          if pressed
            then Started (defaultSnake, Nothing, initSeed)
            else model
        Started _ -> model

# Introduction to FRP

## Hello World

    import Graphics.Element exposing (..)

    main : Element
    main =
      show "Hello, World!"

[HelloWorld.elm](HelloWorld.elm)

Weird, why the double quotes ? Let's try to get rid of them...

## Improved Hello World

    import Graphics.Element exposing (..)
    import Text

    main : Element
    main =
      leftAligned (Text.monospace (Text.fromString "Hello World!"))

WTF? Let's delve into this issue a bit as it's also a way to take a quick look at types.

## The Hello World Conundrum

Let's look at `show`, it's defined in [`Graphics.Element`](http://package.elm-lang.org/packages/elm-lang/core/2.0.1/Graphics-Element) and it's type signature is:

    show : a -> Element

in fact `show` is defined as:

    show value =
    leftAligned (Text.monospace (Text.fromString (toString value)))

this looks almost like our improved Hello World except since the input to show can be any type, it first uses `toString` to convert `value` to a `String`.

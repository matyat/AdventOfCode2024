{-# LANGUAGE OverloadedStrings #-}
module Day03 where

import Data.Char
import Data.Either
import Data.Text
import Data.Attoparsec.Text
import Data.Attoparsec.Combinator

mulCommand :: Parser (Int, Int)
mulCommand = do
    takeTill (=='m')
    mulCommand' <> (anyChar >> mulCommand)

mulCommand' = do
    string "mul("
    v1 <- decimal
    char ','
    v2 <- decimal
    char ')'
    return (v1,v2)

mulCommands :: Parser [(Int, Int)]
mulCommands = (do
    x <- mulCommand
    xs <- mulCommands
    return (x:xs)) <> return []

mulCommandWithDontAndDo :: Parser (Int, Int)
mulCommandWithDontAndDo = do
    takeTill (\c -> c == 'd' || c == 'm')
    nextChar <- peekChar'
    case nextChar of
        'd' -> (dontAndDo >> mulCommandWithDontAndDo)
        'm' -> mulCommand'
        <> (anyChar >> mulCommandWithDontAndDo)

dontAndDo :: Parser ()
dontAndDo = string "don't()" >> f
    where f = (do
            takeTill (=='d')
            string "do()"
            return ()) <> (anyChar >> f)

mulCommandsWithDontsAndDos :: Parser [(Int, Int)]
mulCommandsWithDontsAndDos = (do
    x <- mulCommandWithDontAndDo
    xs <- mulCommandsWithDontsAndDos
    return (x:xs)) <> return []

totalMulSum :: Text -> Int
totalMulSum text = sum
                 . (Prelude.map (\(x,y) -> x*y))
                 . filterLargeNumbers
                 . (fromRight [])
                 $ parseOnly mulCommands text

totalMulSumWithDontsAndDos :: Text -> Int
totalMulSumWithDontsAndDos text = sum
                 . (Prelude.map (\(x,y) -> x*y))
                 . filterLargeNumbers
                 . (fromRight [])
                 $ parseOnly mulCommandsWithDontsAndDos (append text "mul(0,0)")

filterLargeNumbers :: [(Int, Int)] -> [(Int, Int)]
filterLargeNumbers = Prelude.filter (\(x, y) -> x < 1000 || y < 1000)

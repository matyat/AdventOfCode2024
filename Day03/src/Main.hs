module Main where

import System.IO
import Text.Printf
import Data.Text

import Day03

main :: IO ()
main = do
    fileContents <- readFile "input"
    let part1Answer = totalMulSum $ pack fileContents
    let part2Answer = totalMulSumWithDontsAndDos $ pack fileContents
    printf "Part 1 answer: %d\nPart 2 answer: %d" part1Answer part2Answer

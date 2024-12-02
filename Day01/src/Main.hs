module Main where

import Data.List
import System.IO
import Text.Printf

import Day01

main :: IO ()
main = do
    fileContents <- readFile "input"
    let (l1, l2) = parseLists fileContents
    let part1Answer = sumMinimumDistances l1 l2
    let part2Answer = similarityScore l1 l2
    printf "Part 1 answer: %d\nPart 2 answer: %d\n" part1Answer part2Answer


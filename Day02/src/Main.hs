module Main where

import System.IO
import Text.Printf

import Day02

main :: IO ()
main = do
    fileContents <- readFile "input"
    let seqs = parseSeqs fileContents
    let part1Answer = length $ filter isSafeSeq seqs
    let part2Answer = length $ filter isSafeSeqWithRemoval seqs
    printf "Part 1 answer: %d\nPart 2 answer: %d" part1Answer part2Answer

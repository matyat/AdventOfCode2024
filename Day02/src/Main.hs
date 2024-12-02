module Main where

import System.IO
import Text.Printf

import Day02

main :: IO ()
main = do
    fileContents <- readFile "input"
    let seqs = parseSeqs fileContents
    let areSafe = map isSafeSeq seqs
    let part1Answer = length $ filter (==True) areSafe
    let areSafeWithRemoval = map isSafeSeqWithRemoval seqs
    let part2Answer = length $ filter (==True) areSafeWithRemoval
    printf "Part 1 answer: %d\nPart 2 answer: %d" part1Answer part2Answer

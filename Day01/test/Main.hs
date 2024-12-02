module Main (main) where

import Test.HUnit
import System.Exit

import Day01

distances = TestCase $ assertEqual 
    "example test data" 
    11
    (sumMinimumDistances [3, 4, 2, 1, 3, 3] [4, 3, 5, 3, 9, 3])

parsing = TestCase $ assertEqual
    "example parses correctly"
    ([3,4,2,1,3,3], [4,3,5,3,9,3])
    (parseLists "3 4\n4 3\n2 5\n1 3\n3 9\n3 3\n")

similarity = TestCase $ assertEqual
    "example test data similarity score"
    31
    (similarityScore [3,4,2,1,3,3] [4,3,5,3,9,3])

main :: IO ()
main = do
    counts <- runTestTT ( test [
            distances
        ,   parsing
        ,   similarity
        ])
    if (errors counts + failures counts == 0)
        then exitSuccess
        else exitFailure

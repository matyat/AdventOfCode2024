module Main (main) where

import Test.HUnit
import System.Exit

import Day02

safeSeq1 = TestCase $ assertEqual 
    "seq 1"
    True
    (isSafeSeq [7,6,4,2,1])

safeSeq2 = TestCase $ assertEqual
    "seq 2"
    False
    (isSafeSeq [1,2,7,8,9])

safeSeq3 = TestCase $ assertEqual
    "seq 3"
    False
    (isSafeSeq [9,7,6,2,1])

safeSeq4 = TestCase $ assertEqual
    "seq 4"
    False
    (isSafeSeq [1,3,2,4,5])

safeSeq5 = TestCase $ assertEqual
    "seq 5"
    False
    (isSafeSeq [8,6,4,4,1])

safeSeq6 = TestCase $ assertEqual
    "seq 6"
    True
    (isSafeSeq [1,3,6,7,9])

safeSeqWithRemoval1 = TestCase $ assertEqual 
    "seq with removal 1"
    True
    (isSafeSeqWithRemoval [7,6,4,2,1])

safeSeqWithRemoval2 = TestCase $ assertEqual
    "seq with removal 2"
    False
    (isSafeSeqWithRemoval [1,2,7,8,9])

safeSeqWithRemoval3 = TestCase $ assertEqual
    "seq with removal 3"
    False
    (isSafeSeqWithRemoval [9,7,6,2,1])

safeSeqWithRemoval4 = TestCase $ assertEqual
    "seq with removal 4"
    True
    (isSafeSeqWithRemoval [1,3,2,4,5])

safeSeqWithRemoval5 = TestCase $ assertEqual
    "seq with removal 5"
    True
    (isSafeSeqWithRemoval [8,6,4,4,1])

safeSeqWithRemoval6 = TestCase $ assertEqual
    "seq with removal 6"
    True
    (isSafeSeqWithRemoval [1,3,6,7,9])

safeSeqWithRemoval7 = TestCase $ assertEqual
    "seq with removal 7"
    True
    (isSafeSeqWithRemoval [8,9,7,6,5])

safeSeqWithRemoval8 = TestCase $ assertEqual
    "seq with removal 8"
    True
    (isSafeSeqWithRemoval [14,9,8,7,6])

safeSeqWithRemoval9 = TestCase $ assertEqual
    "seq with removal 9"
    False
    (isSafeSeqWithRemoval [35,34,31,32,35])

safeSeqWithRemoval10 = TestCase $ assertEqual
    "seq with removal 10"
    True
    (isSafeSeqWithRemoval [56,59,58,55,53,51,49,48])

safeSeqWithRemoval11 = TestCase $ assertEqual
    "seq with removal 11"
    False
    (isSafeSeqWithRemoval [44,47,48,47,46,43])

safeSeqWithRemoval12 = TestCase $ assertEqual
    "seq with removal 12"
    False
    (isSafeSeqWithRemoval [56,57,59,56,54])

safeSeq7 = TestCase $ assertEqual
    "seq 7"
    False
    (isSafeSeq [14,9,8,7,6])


main :: IO ()
main = do
    counts <- runTestTT ( test [
            safeSeq1
        ,   safeSeq2
        ,   safeSeq3
        ,   safeSeq4
        ,   safeSeq5
        ,   safeSeq6
        ,   safeSeq7
        ,   safeSeqWithRemoval1
        ,   safeSeqWithRemoval2
        ,   safeSeqWithRemoval3
        ,   safeSeqWithRemoval4
        ,   safeSeqWithRemoval5
        ,   safeSeqWithRemoval6
        ,   safeSeqWithRemoval7
        ,   safeSeqWithRemoval8
        ,   safeSeqWithRemoval9
        ,   safeSeqWithRemoval10
        ,   safeSeqWithRemoval11
        ,   safeSeqWithRemoval12
        ])
    if (errors counts + failures counts == 0)
        then exitSuccess
        else exitFailure

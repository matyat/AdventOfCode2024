{-# LANGUAGE OverloadedStrings #-}
module Main (main) where

import Test.HUnit
import System.Exit

import Day03

exampleTestCase = TestCase $ assertEqual
    "given example"
    161
    (totalMulSum "xmul(2,4)%&mul[3,7]!@^do_not_mul(5,5)+mul(32,64]then(mul(11,8)mul(8,5))")

exampleTestCase2 = TestCase $ assertEqual
    "given example 2"
    161
    (totalMulSumWithDontsAndDos "xmul(2,4)%&mul[3,7]!@^do_not_mul(5,5)+mul(32,64]then(mul(11,8)mul(8,5))")

bigNumbers = TestCase $ assertEqual
    "example with large numbers"
    0
    (totalMulSum "xmul(1000,1000)")

exampleDontAndDoTestCase = TestCase $ assertEqual
    "give 'don't and do' example"
    48
    (totalMulSumWithDontsAndDos "xmul(2,4)&mul[3,7]!^don't()_mul(5,5)+mul(32,64](mul(11,8)undo()?mul(8,5))")

exampleDontAndDoTestCase2 = TestCase $ assertEqual
    "give 'don't and do' example"
    68
    (totalMulSumWithDontsAndDos "xmul(2,4)&mul[3,7]!^don't()_mul(5,5)+mul(32,64](mul(11,8)undo()?mul(8,5))don't()don't()mul(3,4)do()mul(4,5)do()")

exampleDontAndDoTestCase3 = TestCase $ assertEqual
    "give 'don't and do' example"
    48
    (totalMulSumWithDontsAndDos "xmul(2,4)&mul[3,7]!^don't()_mul(5,5)+mul(32,64](mul(11,8)undo()?mul(8,5))don't()don't()mul(3,4)do()don't()mul(4,5)do()")

exampleDontAndDoTestCase4 = TestCase $ assertEqual
    "give 'don't and do' example"
    1
    (totalMulSumWithDontsAndDos "mul(1,1)don't()dont'()mul(1,1)do()")

main :: IO ()
main = do
    counts <- runTestTT (test [
            exampleTestCase
        ,   exampleTestCase2
        ,   bigNumbers
        ,   exampleDontAndDoTestCase
        ,   exampleDontAndDoTestCase2
        ,   exampleDontAndDoTestCase3
        ,   exampleDontAndDoTestCase4
        ])
    if (errors counts + failures counts == 0)
        then exitSuccess
        else exitFailure

module Day01 where

import Data.List

sumMinimumDistances :: [Int] -> [Int] -> Int
sumMinimumDistances xs ys = 
    let
        xs' = sort xs
        ys' = sort ys
        distances = map (\(x, y) -> abs $ x - y) $ zip xs' ys'
    in 
        sum distances

parseLists :: String -> ([Int], [Int])
parseLists content = 
    let
        linesInFile = lines content
        linePairs = map ((\(x:y:_) -> (x,y)) . map read . words) linesInFile
    in
        unzip linePairs

similarityScore :: [Int] -> [Int] -> Int
similarityScore xs ys = sum [elemSimilarityScore x ys | x <- xs]

elemSimilarityScore :: Int -> [Int] -> Int
elemSimilarityScore x xs =
    let
        mulitplier = length $ filter (==x) xs
    in
        x * mulitplier

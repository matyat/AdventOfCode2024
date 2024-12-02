module Day02 where

parseSeqs :: String -> [[Int]]
parseSeqs xs = [(map read . words) l | l <- lines xs] 

isSafeSeq :: [Int] -> Bool
isSafeSeq (x:y:z:xs) =
    if orderedInRange x y z
    then isSafeSeq (y:z:xs)
    else False
isSafeSeq _ = True

orderedInRange :: Int -> Int -> Int -> Bool
orderedInRange x y z =
    let 
        diff1 = abs $ x - y
        diff2 = abs $ y - z
        ordered = (x > y && y > z) || (x < y && y < z)
    in
        ordered && diff1 >= 1 && diff1 <= 3 && diff2 >= 1 && diff2 <= 3

isSafeSeqWithRemoval :: [Int] -> Bool
isSafeSeqWithRemoval (x:y:z:xs) =
    if orderedInRange x y z
    then isSafeSeqWithRemoval' (x:y:z:xs)
    else isSafeSeq (y:z:xs) || isSafeSeq (x:y:xs) || isSafeSeq (x:z:xs)
isSafeSeqWithRemoval xs = isSafeSeq xs

isSafeSeqWithRemoval' :: [Int] -> Bool
isSafeSeqWithRemoval' (x':x:y:z:xs) =
    if orderedInRange x y z
    then isSafeSeqWithRemoval' (x:y:z:xs)
    else isSafeSeq (x':x:y:xs) || isSafeSeq (x':x:z:xs)
isSafeSeqWithRemoval' xs = isSafeSeq xs

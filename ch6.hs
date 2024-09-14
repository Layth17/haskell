-- functions only ever take 1 parameter and are
-- currying stuff under the hood
-- not really relevant to me

-- ghci> compare 100 90
-- GT

compareWithHundred :: (Num a, Ord a) => a -> Ordering  
compareWithHundred x = compare 100 x  

-- compare 100 returns a function
compareWithHundred' :: (Num a, Ord a) => a -> Ordering  
compareWithHundred' = compare 100 

-- Calling, say, divideByTen 200 is equivalent to 
-- doing 200 / 10, as is doing (/10) 200
divideByTen :: (Floating a) => a -> a  
divideByTen = (/10)  

applyTwice :: (a -> a) -> a -> a  
applyTwice f x = f (f x)  
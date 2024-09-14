

fib :: (Num t, Num a, Ord t) => t -> a
fib 0 = 0
fib 1 = 1
fib x 
  | x < 0 = fib (x + 2) - fib (x + 1)
  | otherwise = fib (x - 1) + fib (x - 2)


maximum' :: Ord a => [a] -> a
maximum' [] = error "maximum of empty list"  
maximum' [x] = x  
maximum' (x:xs)  
    | x > maxTail = x  
    | otherwise = maxTail  
    where maxTail = maximum' xs 

maximum'' :: (Ord a) => [a] -> a  
maximum'' [] = error "maximum of empty list"  
maximum'' [x] = x  
maximum'' (x:xs) = max x (maximum' xs) 

take' :: (Num i, Ord i) => i -> [a] -> [a]  
take' n _  
    | n <= 0   = []  
take' _ []     = []  
take' n (x:xs) = x : take' (n-1) xs 

reverse' :: [a] -> [a]  
reverse' [] = []  
reverse' (x:xs) = reverse' xs ++ [x]  

zip' :: [a] -> [b] -> [(a,b)]  
zip' _ [] = []  
zip' [] _ = []  
zip' (x:xs) (y:ys) = (x,y):zip' xs ys  

elem' :: (Eq a) => a -> [a] -> Bool  
elem' a [] = False  
elem' a (x:xs)  
    | a == x    = True  
    | otherwise = a `elem'` xs 


-- edge cases are often identities
quicksort :: (Ord a) => [a] -> [a]  
quicksort [] = []  
quicksort (x:xs) = 
    let smallerSorted = quicksort [a | a <- xs, a <= x]  
        biggerSorted = quicksort [a | a <- xs, a > x]  
    in  smallerSorted ++ [x] ++ biggerSorted  
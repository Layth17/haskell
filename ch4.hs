import Text.Read (readMaybe)

-- pattern matching
-- think switch statements, i.e. spits out first match 
lucky :: (Integral a) => a -> String  
lucky 7 = "LUCKY NUMBER SEVEN!"  
lucky x = "Sorry, you're out of luck, pal!"  

sayMe :: (Integral a) => a -> String  
sayMe 1 = "One!"  
sayMe 2 = "Two!"  
sayMe 3 = "Three!"  
sayMe 4 = "Four!"  
sayMe 5 = "Five!"  
sayMe x = "Not between 1 and 5"  

factorial :: (Num a, Enum a) => a -> a
factorial n = product [1..n]

-- 3 * (2 * (1 * factorial 0))
factorial2 :: (Eq t, Num t) => t -> t
factorial2 0 = 1
factorial2 n = n * factorial2 (n - 1)

-- if no pattern is matched, an Exception is raised
-- Non-exhaustive patterns in function charName  
charName :: Char -> String  
charName 'a' = "Albert"  
charName 'b' = "Broseph"  
charName 'c' = "Cecil"  

addVectors :: (Num a) => (a, a) -> (a, a) -> (a, a)  
addVectors a b = (fst a + fst b, snd a + snd b)  

addVectors2 :: (Num a) => (a, a) -> (a, a) -> (a, a)  
addVectors2 (x1, y1) (x2, y2) = (x1 + x2, y1 + y2)  

-- wanna do your own `fst`  for x-dims?
first :: (a, b, c) -> a  
first (x, _, _) = x  
  
second :: (a, b, c) -> b  
second (_, y, _) = y  
  
third :: (a, b, c) -> c  
third (_, _, z) = z  

-- pattern matching in list comprehensions
-- ghci> let xs = [(1,3), (4,3), (2,4), (5,3), (5,6), (3,1)]  
-- ghci> [a+b | (a,b) <- xs]  
-- [4,7,6,8,11,4]  

-- same as `head` just w/ our own error msg
head' :: [a] -> a  
head' [] = error "Can't call head on an empty list, dummy!"  
-- some x prepended to stuff
head' (x:_) = x  

-- x:y:[] == [x,y]
tell :: (Show a) => [a] -> String  
tell [] = "The list is empty"  
tell (x:[]) = "The list has one element: " ++ show x  
tell (x:y:[]) = "The list has two elements: " ++ show x ++ " and " ++ show y  
tell (x:y:_) = "This list is long. The first two elements are: " ++ show x ++ " and " ++ show y  
-- tell [x,y,_] = "blah " ++ show x ++ " and " ++ show y 

length' :: (Num b) => [a] -> b  
length' [] = 0  
length' (_:xs) = 1 + length' xs  

sum' :: (Num a) => [a] -> a  
sum' [] = 0  
sum' (x:xs) = x + sum' xs  

-- referencing using @ 
capital :: String -> String  
capital "" = "Empty string, whoops!"  
capital all@(x:xs) = "The first letter of " ++ all ++ " is " ++ [x] 

-- guards!
-- otherwise = True
densityTell :: (RealFloat a) => a -> String  
densityTell density  
    | density < 1.2 = "Wow! You're going for a ride in the sky!"  
    | density <= 1000.0 = "Have fun swimming, but watch out for sharks!"  
    | otherwise   = "If it's sink or swim, you're going to sink."  

max' :: (Ord a) => a -> a -> a  
max' a b  
    | a > b     = a  
    | otherwise = b 

-- can be done inline, but really just dont
max'' :: (Ord a) => a -> a -> a  
max'' a b | a > b = a | otherwise = b 

myCompare :: (Ord a) => a -> a -> Ordering  
a `myCompare` b  
    | a > b     = GT  
    | a == b    = EQ  
    | otherwise = LT  


densityTell' :: String -> String
densityTell' input  
    | Just density <- readMaybe input, density < 1.2 = "Wow! You're going for a ride in the sky!"  
    | Just density <- readMaybe input, density <= 1000.0 = "Have fun swimming, but watch out for sharks!"  
    | Nothing <- readMaybe input :: Maybe Double = "You know I need a density, right?"  
    | otherwise   = "If it's sink or swim, you're going to sink."  

-- bind calculations to named var using `where`
densityTell'' :: (RealFloat a) => a -> a -> String  
densityTell'' mass volume  
    | density < air = "Wow! You're going for a ride in the sky!"  
    | density <= water = "Have fun swimming, but watch out for sharks!"  
    | otherwise   = "If it's sink or swim, you're going to sink."  
    where density = mass / volume
          air = 1.2  
          water = 1000.0

initials :: String -> String -> String  
initials firstname lastname = [f] ++ ". " ++ [l] ++ "."  
    where (f:_) = firstname  
          (l:_) = lastname 

initials' :: String -> String -> String  
initials' (f:_) (l:_) = [f] ++ ". " ++ [l] ++ "."

-- It's a common idiom to make a function and define some helper function in its where clause
calcDensities :: (RealFloat a) => [(a, a)] -> [a]  
calcDensities xs = [density m v | (m, v) <- xs]  
    where density mass volume = mass / volume  

-- <expression> == <let <bindings> in <expression>>
-- The names that you define in the <let> part 
-- are accessible to the expression after the <in> part
cylinder :: (RealFloat a) => a -> a -> a  
cylinder r h = 
    let sideArea = 2 * pi * r * h  
        topArea = pi * r ^2  
    in  sideArea + 2 * topArea  

-- ghci> 4 * (let a = 9 in a + 1) + 2  
-- ghci> [let square x = x * x in (square 5, square 3, square 2)] 
calcDensities' :: (RealFloat a) => [(a, a)] -> [a]  
calcDensities' xs = [density | (m, v) <- xs, let density = m / v] 
-- We can't use the density name in the (m, v) <- xs part because 
-- it's defined prior to the let binding.
-- <in> part controls scope. if omitted, scope defaults to the next thing


-- case expressions
head1' :: [a] -> a  
head1' [] = error "No head for empty lists!"  
head1' (x:_) = x  

head2' :: [a] -> a  
head2' xs = case xs of [] -> error "No head for empty lists!"  
                       (x:_) -> x  

-- more generally
-- case expression of pattern -> result  
--                    pattern -> result  
--                    pattern -> result  
--                    ...  

describeList :: [a] -> String  
describeList xs = "The list is " ++ case xs of [] -> "empty."  
                                               [x] -> "a singleton list."  
                                               xs -> "a longer list."  

describeList' :: [a] -> String  
describeList' xs = "The list is " ++ what xs  
    where what [] = "empty."  
          what [x] = "a singleton list."  
          what xs = "a longer list."  
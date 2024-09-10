-- run ` ghci app/Main.hs` to play with functions

doubleMe :: Num a => a -> a
doubleMe x = x + x

doubleUs :: Num a => a -> a -> a
doubleUs x y = doubleMe x + doubleMe y

doubleSmall :: (Ord a, Num a) => a -> a
doubleSmall x = (if x > 100 then x else doubleMe x) + 1

-- a function that takes no params is called *definition* or *name*
conanO'Brien :: String
conanO'Brien = "It's a-me, Conan O'Brien!"   

-- lists must be homogeneous
nums :: [Integer]
nums = [4, 6, 7, 2, 1, 7]

-- concat two lists
-- Haskell has to walk through the whole list on the left side of ++
concatLists :: [a] -> [a] -> [a]
concatLists a b = a ++ b

-- : operator (also called the cons operator) is instantaneous.
-- prepend 'a' " cat"
prepend :: a -> [a] -> [a]
prepend a b = a:b

-- indexing starts at 0
-- recall: strings are arrays of char
getElement :: [a] -> Int -> a
getElement a b = a !! b

-- `head`, `last`, `tail` returns (...], `init` returns [...)
-- ^ NOT to be used on empty lists
-- xToLast [1,2,3,4,5,6,7,8,9,0] 4
-- 7
xToLast :: (Eq t, Num t, Num a) => [a] -> t -> a
xToLast a x = if x == 1 then last a else xToLast (init a) (x - 1)

-- `length`, `reverse`
-- `null` --- check if list is empty 
-- `take` x [8,4,2,1,5,6] --- extracts x head
-- `drop` x [8,4,2,1,5,6] --- drops x head
-- maximum [...]
-- minimum [...]
-- sum [...]
--- product [...]
-- 4 `elem` [3,4,5,6]? is 4 in said list?

-- dont like this
-- naiive sequences that follow a+(s-a) to b
-- pro tip: dont use floats in ranges
enumNstep :: Enum a => a -> a -> a -> [a]
enumNstep a b s = [a,s..b]

-- revEnum 12 24
-- [24,23,22,21,20,19,18,17,16,15,14,13,12]
revEnum :: (Num a, Enum a) => a -> a -> [a]
revEnum a b = [b,b-1..a]

-- `cycle` takes a list and cycles it into an 
-- infinite list. If you just try to display 
-- the result, it will go on forever so you 
-- have to slice it off somewhere.
-- take 10 (cycle [1,2,3])
-- [1,2,3,1,2,3,1,2,3,1]
-- lastElemInCycle [1,2,3] 10
-- 1
lastElemInCycle :: [a] -> Int -> a
lastElemInCycle c n = last (take n (cycle c))

-- `repeat` takes an element and produces an infinite 
-- list of just that element. It's like cycling a 
-- list with only one element.
-- take 10 (repeat 5)  
-- [5,5,5,5,5,5,5,5,5,5]  
-- replicate (built-in)
-- replicate 10 5

-- x is drawn from [1..10] 
-- and for every element,
-- we get that element, only doubled. 
doubleRange :: (Enum a, Num a) => a -> a -> [a]
doubleRange lB uB = [x*2 | x <- [lB..uB]]

-- return all x between lB and uB whose 
-- remainder when divided by d is equal to r
-- using a predicate is also called filtering.
-- if the predicate does not return True then the
-- element wont see the light of day
doubleRangeOnPredicate :: Integral a => a -> a -> a -> a -> [a]
doubleRangeOnPredicate lB uB d r = [x | x <- [lB..uB], x `mod` d == r]

-- chained predicates
-- [ x | x <- [10..20], x /= 13, x /= 15, x /= 19]  
-- [10,11,12,14,16,17,18,20]  

-- multi lists
-- [ x*y | x <- [2,5,10], y <- [8,10,11]]  
-- [16,20,22,40,50,55,80,100,110]   

-- numbers = ["1", "2", "3"]
-- objects = ["apple(s)","orange(s)","banana(s)"]  
-- [n ++ " " ++ o | n <- numbers, o <- objects]
-- execrise: create [1..4] then coerce to string in list comprehension

-- basically `length`
-- `_` is an important keyword 
-- (it means we are not using it)
length' :: Num a => [t] -> a
length' xs = sum [1 | _ <- xs]

removeNonUppercase :: [Char] -> [Char]
removeNonUppercase st = [ c | c <- st, c `elem` ['A'..'Z']]   

-- remove odds from each list
-- let xxs = 
-- [
-- [1,3,5,2,3,1,2,4,5],
-- [1,2,3,4,5,6,7,8,9],
-- [1,2,4,2,1,6,3,1,3,2,3,6]
-- ]  
-- [ [ x | x <- xs, even x ] | xs <- xxs] 

-- segments a string on a delimiter d
-- delim st d = 


-- list of tuples must have similar size tuples
-- tuples dont have to be homogeneous
-- must know in advance the size of the tuple
-- but they have to have the same patter of types
-- e.g. [(int, char), (int, char), ...]
-- ("hello") == "hello"


-- `fst` takes a pair and returns its first component.
-- `snd` takes a pair and returns its second component.

-- matches list with other list
-- takes the smallest of the two if size is diff
-- zip [1 .. 5] ["one", "two", "three", "four", "five"] 
-- [(1,"one"),(2,"two"),(3,"three"),(4,"four"),(5,"five")]  

numberMyElementsFrom :: Enum a => [b] -> a -> [(a, b)]
numberMyElementsFrom xs a = zip [a..] xs

-- EXERCISE: which right triangle that has 
-- integers for all sides and all sides equal
-- to or smaller than 10 has a perimeter of 24? 

-- this is how to generate all possible triangles
triangles :: [(Integer, Integer, Integer)]
triangles = [ (a,b,c) | a <- [1..10], b <- [1..10], c <- [1..10] ]

-- this is how to generate rightTriangles
-- notice the ranges here. Protects against [(4,3,5),(3,4,5)...]
rightTriangles :: [(Integer, Integer, Integer)]
rightTriangles = 
  [ (a,b,c) | 
  c <- [1..10], b <- [1..c], a <- [1..b],
  a^2 + b^2 == c^2]


rightTrianglesEqualPerimeter :: (Num c, Eq c, Enum c) => c -> c -> [(c, c, c)]
rightTrianglesEqualPerimeter p maxSide = 
  [ (a,b,c) | 
  c <- [1..maxSide], b <- [1..c], a <- [1..b],
  a^2 + b^2 == c^2, a+b+c == p]
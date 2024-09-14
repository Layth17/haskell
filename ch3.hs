import Data.Coerce (coerce)

-- ### general
-- to examine type of object do
-- :t 'a'
-- :: means 'has type of'
-- The parameters are separated with ->

-- ### types
-- `Int` bounded by limits of 32/64-bit machines
-- `Integer` not bounded by less efficient
-- `Float` floating points w single precision
-- `Double` ^ but double the precision
-- `Bool` True or False
-- `Chat` 's' single characters
-- `Tuples` ()

-- `a` special generic type. 
-- By convention, they are usually a, b, c, ...
-- type variables are called polymorphic functions
-- examples :t fst    or     :t head

-- ### typeclasses
-- ghci> :t (==)  
-- (==) :: (Eq a) => a -> a -> Bool  
-- Everything before the => symbol is called a class constraint.
-- the equality function takes any two values that are of the same 
-- type and returns a Bool. The type of those two values must 
-- be a member of the Eq class (this was the class constraint).

coerceIntoString :: Show a => a -> String
coerceIntoString a = show a


-- ghci> read "True" || False  
-- True  
-- ghci> read "8.2" + 3.8  
-- 12.0  
-- ghci> read "5" - 2  
-- 3  
-- ghci> read "[1,2,3,4]" ++ [3]  
-- [1,2,3,4,3]  
coerceOutOfString :: Read a => String -> a
coerceOutOfString a = read a
-- read "4" is ambiugous because the *use* case 
-- is what tells the compiler how to coerce it
-- instead, you can do read "4" :: Int

-- `Enum` typeclass has defined `succ` and `pred` functions
-- Types in this class: 
-- (), Bool, Char, Ordering, Int, Integer, Float and Double.
-- ghci> ['a'..'e']  
-- "abcde"  
-- ghci> [LT .. GT]  
-- [LT,EQ,GT]  
-- ghci> [3 .. 5]  
-- [3,4,5]  
-- ghci> succ 'B'  
-- 'C'  

-- `Num` numeric typeclass == real + integral numbers
-- `Integral` numeric typeclass = `Int` and `Integer`
-- `Floating` numeric typeclass == `Float` and `Double`

-- built-in hasndy function to convert Integral to Num
-- fromIntegral :: (Num b, Integral a) => a -> b
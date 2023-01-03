/*
  Getting familiar with the language
*/

module learning

import StdEnv

// a function
fact n = prod [1..n]

// a function with two arguments
over n k = fact n / (fact k * fact (n-k))

// function by cases
fib n
    | n < 2 = 1
    | otherwise = (fib (n - 1)) +  (fib (n - 2))

// function by patterns
myreverse [] = []
myreverse [h:t] = (myreverse t) ++ [h]

// mutually recursive functions
even 0 = True
even n = odd (n - 1)
odd 0 = False
odd n = even (n - 1)

// optional typing
PI :: Real
PI = 3.14
nums :: [[Int]]
nums = [[], [1], [2, 3], [4, 5, 6]]

// I think summation is not polymorphic but overloaded
summation [x] = x
summation [x:xs] = x + summation xs
intsum = summation [1,2,3]
fltsum = summation [1.0, 2.0, 3.0]

pow :: Int Int -> Int
pow x 0 = 1
pow x n = x * pow x (n - 1)

inc :: Int -> Int
inc n = n + 1

// function composition
add2 :: (Int -> Int)
add2 = inc o inc

// list comprehensions
qsort :: [a] -> [a] | Ord a
qsort [] = []
qsort [x] = [x]
qsort [p:xs] = qsort [ x \\ x <- xs | x < p] ++ [p] ++ qsort [ x \\ x <- xs | x >= p]

// infinite lists
From :: Int -> [Int]
From n = [n : From (n + 1)]

all_primes :: [Int]
all_primes = sieve [2..]

sieve :: [Int] -> [Int]
sieve [prime:rest] = [prime : sieve [i \\ i<-rest | i mod prime <> 0]]

// don't know why this is not defined...
(mod) a b = a - b * (a / b)

// records
:: Point = { x :: Int, y :: Int }

manhattan :: Point -> Int
manhattan {x, y} = abs x + abs y

// algebraic data types
:: Tree a = Node a (Tree a) (Tree a)
          | Leaf

treeSize :: (Tree a) -> Int
treeSize Leaf = 0
treeSize (Node _ l r) = 1 + (treeSize l) + (treeSize r)


// 1. functions without arguments are constants
// 2. note the partial application of (over 10)
// 3. let
Start = let a = map (over 10) [0..10]
            b = map fib [0..10]
            c = myreverse [1..10]
            d = map (pow 128) [0, 1, 2, 3]
            e = map (\x = x * x) [0, 1, 2, 3]
            f = map add2 [0..3]
            g = take 5 [0,10..]
            h = qsort [7,8,9,4,5,6,1,2,3]
            i = [x*x \\ x <- [1..9] | x > 5]
            j = take 10 (From 100)
            k = take 10 all_primes
            l = map manhattan [{x=x,y=y} \\ x<-[1..3], y<-[1..3]]
            m = [treeSize Leaf, treeSize (Node 'A' Leaf (Node 'B' (Node 'C' Leaf Leaf) (Node 'D' Leaf Leaf)))]
        in a ++ b ++ c ++ d ++ e ++ f ++ g ++ h ++ i ++ j ++ k ++ l ++ m


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

// not sure if this polymorphism is valid -- i.e. is summation really generic, or does it only work because intsum and fltsum are not used?
summation [x] = x
summation [x:xs] = x + summation xs
intsum = summation [1,2,3]
fltsum = summation [1.0, 2.0, 3.0]

// 1. functions without arguments are constants 
// 2. note the partial application of (over 10)
// 3. let
Start = let a = map (over 10) [0..10] 
            b = map fib [0..10] 
            c = myreverse [1..10]
        in a ++ b ++ c


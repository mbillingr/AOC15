module part2

import StdEnv

Start :: *World -> Int
Start world
    # (readok,infile,world) = sfopen "input.txt" FReadText world
    | not readok            = abort "Cannot open input.txt"
    # data                  = load_file infile
    | otherwise             = solve data

solve :: [Char] -> Int
solve input = let path1 = (path (list_step input) [(0,0)])
                  path2 = (path (list_step (tl input)) [(0,0)])
              in (length o unique) (path1 ++ path2)

list_step :: [a] -> [a]
list_step [] = []
list_step [x] = [x]
list_step [x:y:xs] = [x : list_step xs]

path :: [Char] [(Int,Int)] -> [(Int, Int)]
path [] positions = positions
path ['^':chs] [(x,y):ps] = path chs [(x,y+1) : (x,y) : ps]
path ['<':chs] [(x,y):ps] = path chs [(x-1,y) : (x,y) : ps]
path ['v':chs] [(x,y):ps] = path chs [(x,y-1) : (x,y) : ps]
path ['>':chs] [(x,y):ps] = path chs [(x+1,y) : (x,y) : ps]
path [c:_] _ =  abort {#c}

unique :: ([(Int,Int)] -> [(Int,Int)])
unique = dedup o sort

dedup :: [(Int,Int)] -> [(Int,Int)]
dedup [] = []
dedup [x] = [x]
dedup [x:y:xs]
    | x == y    = dedup [y:xs]
    | otherwise = [x : dedup [y:xs]]

load_file :: File -> [Char]
load_file f
    # (readok, char, file`) = sfreadc f
    | not readok = []
    #! chars = load_file file`
    | otherwise = [char : chars]
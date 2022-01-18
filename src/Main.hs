module Main where
data Lista a = Null | Add a (Lista a)

listasimples :: Lista Int
listasimples = Add 1 (Add 2(Add 3 Null)) 

concatenar :: [a] -> [a] -> [a]
concatenar [] y = y
concatenar (x:xs) y = x : concatenar [] y

somar :: [Int] -> Int
somar [] = 0
somar (x:xs) = x + somar xs 

produto :: [Int] -> Int
produto [] = 1
produto (x:xs) = x * produto xs

maximo :: [Int] -> Int
maximo [] = 0
maximo (x:xs) = let teste = maximo xs in 
  if x > teste then x else teste 

replicate :: Int -> a -> [a]
replicate a b = if a > 0 then b : Main.replicate (a-1) b else [] 

map :: (a -> b) -> [a] -> [b]
map fn [] = []
map fn (x:xs) = fn x : Main.map fn xs 

fold :: (a -> b -> a) -> a -> [b] -> a
fold fn acc [] = acc
fold fn acc (x:xs) = fold fn (fn acc x) xs 

particionar :: (a -> Bool) -> [a] -> ([a], [a])
particionar fn [] = ([], [])
particionar fn (x:xs) = let (a, b) = particionar fn xs in 
  if fn x then (x:a, b) else (a, x:b) 

index :: [a] -> Int -> Maybe a
index [] a = Nothing
index (x:xs) a = if a == 0 then Just x else index xs (a-1) 

element :: Int -> [Int] -> Bool
element a [] = False
element a (x:xs) = if a == x then True else element a xs 


main :: IO ()
main = do
  putStrLn "hello world"

module Main where

soma :: Int -> Int -> Int
soma x 0 = x
soma 0 y = y
soma x y = x + y

main :: IO ()
main = do
  putStrLn "hello world"

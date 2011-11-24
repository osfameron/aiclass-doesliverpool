import qualified Data.Map as M
chain = "AAAAB"

p = markovise chain

markovise c =
    let c' = zip c (tail c)
        f m k = M.insertWith (+) k 1 m
        s = foldl f M.empty c'
    in s

import System.Environment
fibo :: Integer -> (Integer, Integer, Integer)
fibo n = fiboAux 0 1 1 2
    where fiboAux n0 n1 n2 acc  
            | acc == n   = (n0, n1, n2)
            | otherwise  = fiboAux n1 n2 (n1 + n2) (acc + 1)

--log2(N!)≈12log2(2πN)+Nlog2(N)−Nlog2(e)
log2Fact :: Integer -> Double 
log2Fact n = (1.0/2.0 * logBase 2 (2 * pi * f)) + (f * logBase 2 f) - (f * logBase 2 2.7182818284590452353)
    where
        f = fromIntegral n

fact 0 = 1
fact n = n * fact (n-1)

log2Fact' = logBase 2 . fact . fromIntegral  

jaweno :: Integer -> Integer
jaweno 0 = 0
jaweno 1 = 0
jaweno 2 = 1
jaweno k = truncate (log2 - (log0 + log1))
    where 
        (n_minus_1, n, n_plus_1) = fibo k
        log2 = log2Fact n_plus_1
        log1 = log2Fact n
        log0 = log2Fact n_minus_1

main :: IO()
main = do
    args <- getArgs 

    let n = head args

    print . jaweno . (+1) . read $ n
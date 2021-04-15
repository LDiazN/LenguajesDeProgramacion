data Arbol a = Hoja | Rama a (Arbol a) (Arbol a) deriving(Show)

foldA :: (a -> b -> b -> b) -> b -> Arbol a -> b
foldA _ zero Hoja = zero
foldA f zero (Rama x l r) = f x (foldA f zero l) (foldA f zero r) 

genA :: Int -> Arbol Int
genA n = Rama n (genA (n + 1)) (genA (n * 2))

takeWhileA :: (a -> Bool) -> Arbol a -> Arbol a
takeWhileA p = foldA (\a i d -> if p a then Rama a i d else Hoja) Hoja

x = takeWhileA (<= 3) (genA 1)



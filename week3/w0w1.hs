table :: [(Float,Float)]
table = [
    (0.0, 3.0),
    (1.0, 6.0),
    (2.0, 7.0),
    (3.0, 8.0),
    (4.0, 11.0) ]

-- sanity check against earlier example
t2 :: [(Float,Float)]
t2 = [
    (3.0, 0.0),
    (6.0, (-3.0)),
    (4.0, (-1.0)),
    (5.0, (-2.0))]

w :: [(Float,Float)] -> (Float,Float)
w t =
    let m = fromIntegral $ length t
        xs        = map fst t
        ys        = map snd t
        sum_xi    = sum xs
        sum_yi    = sum ys
        -- sum_xi_yi = sum $ map (\i -> (fst i) * (snd i)) t
        sum_xi_yi = sum $ map (uncurry (*)) t
        sum_xi_2  = sum $ map (^2) xs
        w1 =   ((m * sum_xi_yi) - (sum_xi * sum_yi)) 
             / ((m * sum_xi_2)  - (sum_xi)^2)
        w0 = ((1.0)/m * sum_yi) - (w1/m * sum_xi)
    in (w0, w1)

regress t = let (w0,w1) = w t
                xs   = map fst t
                minx = foldl1 min xs
                manx = foldl1 max xs
                f x  = (w1 * x) + w0
                f' x = (x, f x)
            in map f' [minx..manx]

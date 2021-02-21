function facto(n)
    if n < 2 then return 1 end
    return n * facto(n-1)
end
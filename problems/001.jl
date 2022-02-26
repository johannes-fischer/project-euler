function multiples(p, M)
    n = (M-1) ÷ p
    m = p * (n+1) * n / 2
end

limit = 1000
multiples(3, limit) + multiples(5, limit) - multiples(15, limit)
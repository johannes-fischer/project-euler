ϕ = (1 + √5) / 2

x = y = 1
i = 2
while y < 100000
    i += 1
    x, y = y, x + y
    println(y / x - ϕ)
end
F_i = y

#  121393 * phi^N > 10^1000
# log(F_i) + N * log(phi) > 1000 * log(10)
# N > (1000 * log(10) - log(F_i)) / log(ϕ)
N = Int(ceil(i + ((1000 - 1) * log(10) - log(F_i)) / log(ϕ)))

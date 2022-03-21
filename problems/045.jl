triangle(n) = n * (n + 1) ÷ 2
istriangle(n) = isinteger((-1 + √(1 + 8n)) / 2)
inv_triangle(n) = Int((-1 + √(1 + 8n)) / 2)

pentagonal(n) = n * (3n - 1) ÷ 2
ispentagonal(n) = isinteger((1 + √(1 + 24n)) / 6)
inv_pentagonal(n) = Int((1 + √(1 + 24n)) / 6)

hexagonal(n) = n * (2n - 1)
ishexagonal(n) = isinteger((1 + √(1 + 8n)) / 4)
inv_hexagonal(n) = Int((1 + √(1 + 8n)) / 4)

n = 143
while true
    n += 1
    N = hexagonal(n)
    if istriangle(N) && ispentagonal(N)
        break
    end
end
N
n


n = 285
while true
    n += 1
    N = triangle(n)
    if ishexagonal(N) && ispentagonal(N)
        break
    end
end
N
n


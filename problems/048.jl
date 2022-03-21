parse(Int, string(sum(big(k)^k for k = 1:1000))[end-9:end])

lim = 10^10

s = 0
for k in 1:1000
    x = 1
    for _ in 1:k
        x *= k
        x %= lim
    end
    s += x
end
s % lim
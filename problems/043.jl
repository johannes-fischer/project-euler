using Combinatorics

primes = [2,3,5,7,11,13,17]

s = 0
for perm in permutations([0,1,2,3,4,5,6,7,8,9])
    flag = true
    l = length(perm)
    for (i, p) in zip(2:8, primes)
        d = evalpoly(10, perm[l-i-1:l-i+1])
        if d % p != 0
            flag = false
            break
        end
    end
    if flag
        d = evalpoly(10, perm)
        s += d
        @show d
    end
end
s
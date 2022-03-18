includet("../primes.jl")

M = 1000

prime_max = 1000000
primes = sieve_of_eratosthenes(prime_max)
prime_set = Set(primes)

b_values = filter(<(M), primes)

maximal = (0, 0, 0)

a_values = -1000:1000
for a in a_values, b in b_values
    n = 0
    while true
        q = n^2 + a*n + b
        if q > prime_max
            @error "Need more primes"
        elseif q ∈ prime_set
            n += 1
        else
            break
        end
    end
    if first(maximal) < n
        maximal = (n, a, b)
    end
end
maximal
maximal[2] * maximal[3]
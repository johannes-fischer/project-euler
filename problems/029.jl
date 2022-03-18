using DataStructures
includet("../primes.jl")

M = 100
primes = sieve_of_eratosthenes(M)
primeset = Set(primes)
# s = 0
unique_factors = Set()
for a in 2:M, b in 2:M
    f = factorize(a, primes)
    x = length.(findall.(.==(primes), (f,)))
    x *= b
    push!(unique_factors, Tuple(x))

    # if b ∉ primeset
    #     d = divisors(counter(factorize(b, primes)))
    #     if a^d[2] <= M
    #         println("skip $a^$b")
    #         continue
    #     elseif a^b == 64
    #         println("keep $a^$b")
    #     end
    # end
    # if a ∉ primeset
    #     d = divisors(counter(factorize(a, primes)))

    # end
    # s += 1
end
unique_factors


include("../primes.jl")

low_primes = sieve_of_eratosthenes(100000)

N = 600851475143
fact, n = factorize(N, low_primes)

@assert n == 1
fact[end]
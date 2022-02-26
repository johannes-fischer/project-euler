includet("../primes.jl")

sieve_of_eratosthenes(10) |> sum
sieve_of_eratosthenes(2000000) |> sum
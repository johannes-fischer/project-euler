includet("../primes.jl")

primes = sieve_of_eratosthenes(10^6)

K = 4

numbers = collect(1:K)
distinct = ones(Int, K)

n = numbers[end]
while true
    n += 1
    numbers[1:end-1] = numbers[2:end]
    numbers[end] = n
    distinct[1:end-1] = distinct[2:end]
    distinct[end] = length(Set(factorize(n)))
    if all(distinct .== K)
        @show numbers[1]
        break
    end
end

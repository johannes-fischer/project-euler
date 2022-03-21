includet("../primes.jl")

primes = sieve_of_eratosthenes(7654321)

function ispandigital(p)
    d = digits(p)
    maximum(d) == length(d) && length(Set(d)) == length(d)
end

for p in Iterators.reverse(primes)
    if ispandigital(p)
        @show p
        break
    end
end


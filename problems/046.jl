includet("../primes.jl")

primes = sieve_of_eratosthenes(10^6)
primeset = Set(primes)

k=1
while true
    k += 2
    k > primes[end] && @error "Need more primes"
    k ∈ primeset && continue
    found = false
    for p in primes
        p > k && break
        if isinteger(sqrt((k - p) / 2))
            found = true
            break
        end
    end
    if !found
        println("$k cannot be written as prime + 2 x square")
        break
    end
end
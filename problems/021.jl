using DataStructures
includet("../primes.jl")

N = 10000

primes = sieve_of_eratosthenes(Int(round(sqrt(N))))

function divisor_sum(N::Int, primes)
    f = factorize(N, primes)
    d = divisors(counter(f))
    sum(d[1:end-1])
end


amicable = Set()
nonamicable = Set()
for a ∈ 2:N
    if a ∈ amicable || a ∈ nonamicable
        continue
    end
    b = divisor_sum(a, primes)
    if a != b && a == divisor_sum(b, primes)
        push!(amicable, a)
        push!(amicable, b)
    else
        push!(nonamicable, a)
        push!(nonamicable, b)
    end
end

sum(amicable)
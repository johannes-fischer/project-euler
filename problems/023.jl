using DataStructures
includet("../primes.jl")

N = 28123

primes = sieve_of_eratosthenes(Int(round(sqrt(N))))

function divisor_sum(N::Int, primes)
    f = factorize(N, primes)
    sum(true_divisors(counter(f)))
end

isabundant(N, primes) = divisor_sum(N, primes) > N

abundant = []
for i in 1:N
    if isabundant(i, primes)
        push!(abundant, i)
    end
end

abundant_sum = falses(N)

for (i, a) in enumerate(abundant)
    for j in 1:i
        b = abundant[j]
        if a+b > N
            break
        end
        abundant_sum[a+b] = true
    end
end

sum((1:N) .* (1 .- abundant_sum))

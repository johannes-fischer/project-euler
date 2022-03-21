includet("../primes.jl")

primes = sieve_of_eratosthenes(10^6)
primeset = Set(primes)

function istruncatable(p::Int)
    dig = digits(p)
    lefttruncatable(dig) && righttruncatable(dig)
end

function righttruncatable(dig)
    for i in 1:length(dig)-1
        q = sum(dig[j] * 10^(j-1) for j in 1:i)
        q ∈ primeset || return false
    end
    true
end

function lefttruncatable(dig)
    l = length(dig)
    for i in 1:l-1
        q = sum(dig[l-i+j] * 10^(j - 1) for j in 1:i)
        q ∈ primeset || return false
    end
    true
end

numbers = Int[]
for p in primes
    p < 10 && continue
    istruncatable(p) && push!(numbers, p)
end
numbers
sum(numbers)
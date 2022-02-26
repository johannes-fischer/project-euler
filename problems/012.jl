includet("../primes.jl")

divisors(n::Int) = divisors(factorize(n) |> first)
function divisors(factorization)
    [2]
end

n = 0
for k in 1:10
    n += k
    d = divisors(n)
    if length(d) > 500
        @show n
        break
    end
end

d = 20 |> factorize |> first |> dict_factorize

divs = zeros(Int, 1 .+ values(d)... )
for (p, m) in d
    for i in 0:m
        divs
end

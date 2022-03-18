using DataStructures

includet("../primes.jl")

n = 0
for k in 1:100000
    n += k
    d = n |> factorize |> first |> counter
    if n_divisors(d) > 500
        @show n
        break
    end
end

d = 76576500 |> factorize |> first |> counter
divisors(d)
n_divisors(d)


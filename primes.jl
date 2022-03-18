function sieve_of_eratosthenes(N)
    primes = trues(N)
    c = 1
    primes[c] = false
    while c < N
        c += 1
        primes[c] || continue
        m = c^2
        while m <= N
            primes[m] = false
            m += c
        end
    end
    findall(primes)
end

factorize(N) = factorize(N, sieve_of_eratosthenes(Int(round(sqrt(N)))))
"""
Return array of all primes with multiples

Requires that primes contains all primes until sqrt(N)

use `DataStructures.counter(factorization)` to get a Dict
"""
function factorize(N, primes)
    factorization = Int[]
    i = 1
    while i <= length(primes)
        p = primes[i]
        d, r = divrem(N, p)
        if r == 0
            N = d
            push!(factorization, p)
        else
            i += 1
        end
        N == 1 && break
    end
    if N != 1
        # Then n has to be the last prime factor
        push!(factorization, N)
    end
    factorization
end

function divisors(factorization::AbstractDict{Int,Int})
    divs = ones(Int, 1 .+ values(factorization)...)
    for (i, (p, m)) in enumerate(factorization)
        x = p .^ (0:m)
        dims = ones(Int, ndims(divs))
        dims[i] = m + 1
        divs .*= reshape(x, dims...)
    end
    sort(divs[:])
end

true_divisors(factorization::AbstractDict) = divisors(factorization)[1:end-1]

n_divisors(factorization::AbstractDict{Int,Int}) = prod(1 .+ values(factorization))
includet("../primes.jl")

M = 10^6

primes = sieve_of_eratosthenes(M)
primeset = Set(primes)
accprimes = accumulate(+, [0, primes...])
nprimes = length(primes)

@time begin
    L = 0
    l = 1

    while true
        l += 1
        sums = view(accprimes, 1+l:nprimes) - view(accprimes, 1:nprimes-l)
        sums[1] > primes[end] && break

        i = 1
        p = primes[i]
        for (j,s) in enumerate(sums)
            while p < s && i < nprimes
                i += 1
                p = primes[i]
            end
            if p == s
                L = l
                @show L, s, j
            elseif i == nprimes || s > primes[end]
                break
            end
        end

    end
end
L


@time begin
    L = 0
    l = 547
    found = false

    while true
        l -= 1
        sums = view(accprimes, 1+l:nprimes) - view(accprimes, 1:nprimes-l)
        sums[1] > primes[end] && continue
        l == 0 && break

        i = nprimes
        p = primes[i]
    # for s in Iterators.reverse(sums)
        for j in length(sums):-1:1
            s = sums[j]
            if s > primes[end]
                continue
            end
            while p > s && i > 1
                i -= 1
                p = primes[i]
            end
            if p == s
                L = l
                @show L, s, j
                found = true
                break
            elseif i == 1
                break
            end
        end
        found && break
    end
end
L
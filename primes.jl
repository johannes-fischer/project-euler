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

function factorize(N)
    fact, n = factorize(N, sieve_of_eratosthenes(Int(round(sqrt(N)))))
    if n != 1
        # Then n has to be the last prime factor
        push!(fact, n)
        n = 1
    end
    return fact, n
end

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
    factorization, N
end

function dict_factorize(factorization)
    d = Dict{Int,Int}()
    for p in factorization
        p in keys(d) ? d[p] += 1 : d[p] = 1
    end
    d
end

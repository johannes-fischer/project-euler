pentagonal(n) = n * (3n - 1) ÷ 2

function ispentagonal(n)
    r = (1 + √(1 + 24n)) / 6
    isinteger(r)
end

pnumbers = [pentagonal(n) for n in 1:1000000]
pnumberset = Set(pnumbers)

# from thread page 9:

# method 2-1

@time for (d, pdiff) in enumerate(pnumbers), l in d-3:-3:1
    k = (pdiff - pnumbers[l]) / 3l
    if isinteger(k)
        pk = pentagonal(Int(k))
        psum = pdiff + 2 * pk
        if ispentagonal(psum)
            pj = pdiff + pk
            @show pj, pk, psum, pdiff
            break
        end
    end
end

# method 2-2

includet("../primes.jl")

primes = sieve_of_eratosthenes(100000000)
begin
    found = false
    @time for (d, pdiff) in enumerate(pnumbers)
        @assert primes[end]^2 > 2pdiff
        divs = divisors(2pdiff, primes)
        for l in divs
            l < d || continue
            (l - d) % 3 == 0 || continue
            @assert (l - d) % 3 == 0 && l < d
            k = (pdiff - pnumbers[l]) / 3l
            if isinteger(k)
                pk = pentagonal(Int(k))
                psum = pdiff + 2 * pk
                if ispentagonal(psum)
                    pj = pdiff + pk
                    @show pj, pk, psum, pdiff
                    found = true
                    break
                end
            end
        end
        found && break
    end
end
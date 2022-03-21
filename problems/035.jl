includet("../primes.jl")


# N = 100
N = 10^6
primes = sieve_of_eratosthenes(N)
primeset = Set(primes)
circularprimes = Vector{Union{Nothing, Bool}}(nothing, length(primes))

tmp = zeros(Int, length(string(N)))

function iscircularprime!(tmp, p::Int)
    tmp .= 0
    tmp[1] = p
    ndigits = length(string(p))
    for i in 2:ndigits
        d, r = divrem(p, 10)
        p = 10^(ndigits-1) * r + d
        tmp[i] = p
        if p ∉ primeset
            return false, nothing
        end
    end
    return true, tmp
end

for (i, p) in enumerate(primes)
    if isnothing(circularprimes[i])
        circular, rotations = iscircularprime!(tmp, p)
        if circular
            for q in rotations
                if q == 0
                    break
                end
                circularprimes[findfirst(==(q), primes)] = true
            end
        else
            circularprimes[i] = false
        end
    end
end
primes[Vector{Bool}(circularprimes)]
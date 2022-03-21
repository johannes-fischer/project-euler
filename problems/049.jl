includet("../primes.jl")

primes = filter(>(1000), sieve_of_eratosthenes(10^4))
primeset = Set(primes)

results = []

# for (i, p) in enumerate([1487])
for (i,p) in enumerate(primes)
    d = sort(digits(p))
    sequence = [p]
    for q in @view primes[i+1:end]
        if d == sort(digits(q))
            push!(sequence, q)
        end
    end
    seqdiff = diff(sequence)
    if length(sequence) >= 3
        for (k, s1) in enumerate(sequence), s2 in @view sequence[k+1:end]
            s3 = 2s2 - s1
            if s3 in sequence
                push!(results, [s1, s2, s3])
            end
        end
    end
    # if length(sequence) == 3 && all(seqdiff .== first(seqdiff))
    #     push!(results, sequence)
    # end
end
results[end]
sum(results[end][3-k] * 10^4k for k = 0:2)
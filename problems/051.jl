using Primes
using Combinatorics

prms = primes(10^7)
idx = [findfirst(p -> ndigits(p) == i, prms) for i in 1:ndigits(prms[end])]


results = Int[]

@time for (ndig, (i, ip1)) in enumerate(zip(idx,idx[2:end]))
    # @show prms[i], prms[ip1-1]
    # ndig == 5 || continue

    for same_idxs in powerset(1:ndig, 1, ndig)
        diff_idxs = trues(ndig)
        diff_idxs[same_idxs] .= false

        dct = Dict{Tuple{Vararg{Int}}, Vector{Int}}()
        for k in i:ip1-1
            p = prms[k]

            pdigits = digits(p)

            diff_digits = pdigits[diff_idxs]
            if length(diff_digits) == 0 || all(diff_digits .== first(diff_digits))
                same_digits = pdigits[same_idxs]
                key = Tuple(same_digits)
                if key in keys(dct)
                    push!(dct[key], p)
                else
                    dct[key] = [p]
                end
            end
        end

        for family in values(dct)
            if length(family) == 8
                @show family
                append!(results, family)
            end
        end
    end
end
minimum(results)
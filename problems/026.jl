cycle_length = 0
longest_cycle = 0
for n in 1:1000
    r = 1
    decimals = []
    while true
        d, r = divrem(r, n)
        idx = findfirst(==((d, r)), decimals)
        if !isnothing(idx)
            @show idx
            len = length(decimals) - idx + 1
            @show len
            if len > cycle_length
                cycle_length = len
                longest_cycle = n
            end
            break
        end
        push!(decimals, (d, r))
        r *= 10
    end

    cycle_length
end
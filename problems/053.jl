function check(n, r, lim=10^6)
    @assert n >= 2r
    k = 1
    while r > 0
        k *= n / r
        n -= 1
        r -= 1
        k >= lim && return true
    end
    @assert r == 0 "r=$r"
    @assert n >= 0 "n=$n"
    return k >= lim
end

c = 0
for n in 1:100
    found = false
    for r in 4:n÷2
        if found || check(n, r, 10^6)
            found = true
            if r == n / 2
                c += 1
            else
                c += 2
            end
        end
    end
end
c
N = 1000000
digits = collect("0123456789")

# N = 5
# digits = collect("012")

permutation = []

N -= 1
while length(digits) > 0
    binsize = factorial(length(digits) - 1)
    d, N = divrem(N, binsize)
    digit = Char(digits[d+1])
    filter!(!=(digit), digits)
    push!(permutation, digit)
end
parse(Int, string(permutation...))
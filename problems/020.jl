N = 100

x = factorial(big(N))
sum(parse(Int, n) for n in string(x))

len = 2 * N

digits = zeros(Int, len)
digits[1] = 1
for i in 1:N
    digits .*= i
    for (i, digit) in enumerate(digits)
        if i == length(digits)
            continue
        end
        d, r = divrem(digit, 10)
        digits[i] = r
        digits[i+1] += d
    end
end
digits
sum(digits)
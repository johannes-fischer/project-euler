N = 1000

x = big(2)^N
sum(parse(Int, n) for n in string(x))

len = 3 * (N ÷ 10) + 10

digits = zeros(Int, len)
digits[1] = 1
for _ in 1:N
    digits .*= 2
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
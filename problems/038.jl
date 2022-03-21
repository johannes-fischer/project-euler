tmp_digits = falses(9)
tmp_number = zeros(Int, 9)
result = 0
# for i = 192:192
for i = 1:9999
    tmp_digits .= false
    max_n = 9 ÷ ndigits(i)
    failed = false
    j = 1
    # @show max_n
    for n in 1:max_n
        if failed == true
            break
        end
        # @show n*i
        for d in reverse(digits(n * i))
            if d == 0 || tmp_digits[d]
                failed = true
                break
            else
                tmp_digits[d] = true
                tmp_number[j] = d
                j += 1
            end
        end

    end
    if all(tmp_digits)
        r = evalpoly(10, reverse(tmp_number))
        if r > result
            result = r
            @show i
            @show tmp_digits
            @show tmp_number
            @show r
        end
    end
end
result

begin
    indices = [10^k for k in 0:6]
    # indices = [1,3,7,12,15,16,17]
    d = 1
    n = 0
    i = 0

    while true
        i += 1
        k = ndigits(i)
        target = first(indices)
        if n + k >= target
            digit = reverse(digits(i))[target - n]
            @show digit
            d *= digit
            popfirst!(indices)
        end
        n += k
        if length(indices) == 0
            break
        end
    end
end
d
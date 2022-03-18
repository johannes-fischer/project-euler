
function digits1(N::Int)
    s = string(N)
    [parse(Int, d) for d in s]
end

function digits2(N::Int)
    digits = []
    d = N
    while true
        d, r = divrem(d, 10)
        push!(digits, r)
        if d == 0
            break
        end
    end
    reverse(digits)
end

pow = 5
numbers = []

# check upper limit: [k*9^5 > 10^(k-1) for k = 1:10]
for i in 2:1000000
    digits = digits1(i)
    s = sum(digits .^ pow)
    if s == i

        push!(numbers, i)
    end
end

sum(numbers)
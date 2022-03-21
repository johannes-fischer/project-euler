K = 10
tmp = zeros.(Int, 1:K)
goedel_base = [2, 3, 5, 7, 11, 13, 17, 19, 23, 27]

function goedel_number(n::Int)
    prod(goedel_base[i+1] for i in digits(n))
end

i = 1
while true
    i += 1
    x = i + 10^ndigits(i)
    g = goedel_number(x)
    if all(goedel_number(k*x) == g for k in 2:6)
        @show x
        break
    end
end

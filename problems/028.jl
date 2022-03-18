N = 1
s = 1
inc = 2
while N < 1001^2
    for i in 1:4
        N += inc
        s += N
    end
    inc += 2
end
@show N, s
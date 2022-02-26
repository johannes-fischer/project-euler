fib = [1, 2]

while fib[end] <= 4_000_000
    push!(fib, fib[end-1] + fib[end])
end
pop!(fib)
sum(fib[2:3:length(fib)])

x=y=1
total = 0
while y < 4000000
    x, y = y, x+y
    if x % 2 == 0
        total += x
    end
end
total

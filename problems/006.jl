numbers = collect(1:100)

n = length(numbers)
s = 0
for i in 1:n, j in 1:n
    if i==j
        continue
    end
    s += numbers[i]*numbers[j]
end
s

sum(1:100)^2 - sum((1:100).^2)
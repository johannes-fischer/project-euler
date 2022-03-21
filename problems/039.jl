p = 120

best_p = 0
best_n = 0
for p = 3:1000
    n = 0
    for a = 1:p/3, b = a:p/2
        c = p - a - b
        if c^2 == a^2 + b^2
            n += 1
        end
    end
    if n > best_n
        best_n = n
        best_p = p
    end
end
best_p
best_n
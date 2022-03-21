includet("../util.jl")

fracts = Rational{Int}[]

for i in 10:99, j in i+1:99
    i1, i2 = divrem(i, 10)
    j1, j2 = divrem(j, 10)
    if i1 == j2 && i * j1 == i2 * j ||
        i2 == j1 && i * j2 == i1 * j
        push!(fracts, i // j)
    end
end
fracts
prod(fracts)
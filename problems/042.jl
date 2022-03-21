s = open("input/p042_words.txt") do f
    readline(f)
end
names = split(s[2:end-1], "\",\"")

triangle_numbers = [n*(n+1)÷2 for n in 1:100]
triangle_set = Set(triangle_numbers)

function numeric_value(s::AbstractString)
    chars = collect(s)
    sum(chars .- 'A' .+ 1)
end

c = 0
for name in names
    d = numeric_value(name)
    d > triangle_numbers[end] && @error "Need more triangle numbers"
    if d ∈ triangle_set
        c += 1
    end
end
c
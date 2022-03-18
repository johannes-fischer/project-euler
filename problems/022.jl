s = open("input/p022_names.txt") do f
    readline(f)
end
names = split(s, ",")
names = replace.(names, "\"" => "")
sort!(names)

score = 0
for (i, name) in enumerate(names)
    score += i * sum(collect(name) .- 'A' .+ 1)
end
includet("../util.jl")

r = 1
for i in 1:20
    r = lcm(r, i)
end
r
# can only have max 7 digits
# factorial(9) * 7
includet("../util.jl")

numbers = Int[]

factorials = [factorial(i) for i in 0:9]

@time for i in 3:7*factorial(9)
    s = sum(factorials[d+1] for d in DigitGenerator(i))
    s == i && push!(numbers, i)
end
sum(numbers)


###

using Combinatorics
using DataStructures

digits = [0,1,2,3,4,5,6,7,8,9]
@time for len in 2:7
    for comb in with_replacement_combinations(digits, len)
        i = sum(factorials[d + 1] for d in comb)
        if counter(comb) == counter(DigitGenerator(i))
            push!(numbers, i)
        end
    end
end


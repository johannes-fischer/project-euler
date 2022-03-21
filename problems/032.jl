includet("../util.jl")
# n x m = n+m-1
# 2n + 2m - 1 = 9
# n + m = 5
# 1 x 4 = 4
# 2 x 3 = 4

products = Set{Int}()

tmp = zeros(Bool, 9)

function ispandigital!(arr, n,m,k)
    arr .= false
    for d in Iterators.flatten(DigitGenerator(number) for number in (n,m,k))
        d == 0 && return false
        arr[d] && return false
        arr[d] = true
    end
    return true
end


function find_pandigitals!(products, tmp, n_range, m_range)
    for n in n_range, m in m_range
        k = n * m
        if k > 9999
            continue
        end
        if ispandigital!(tmp, n,m,k)
            push!(products, k)
        end
    end
end

find_pandigitals!(products, tmp, 1:9, 1000:9999)
find_pandigitals!(products, tmp, 10:99, 100:999)
products
sum(products)
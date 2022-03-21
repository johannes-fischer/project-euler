
# greatest common divisor
# euclidean algorithm
function gcd(a, b)
    d, r = a, b
    while r != 0
        d, s = r, d
        r = s % d
    end
    d
end

# least common multiple
lcm(a, b) = Int(a * b / gcd(a, b))


struct DigitGenerator
    n::Int
end
Base.iterate(gen::DigitGenerator, state=gen.n) = state == 0 ? nothing : reverse(divrem(state, 10))

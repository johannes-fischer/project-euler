N = 585
M = 10^6

digits(N)
tmp_digits = [zeros(Int, l) for l in 1:ndigits(M, base=2)]

function issymmetric(array)
    l = length(array)
    for (i, x) in enumerate(array)
        x != array[l+1-i] && return false
        2i > l && return true
    end
    true
end

function isdoublepalindrome(n::Int)
    digits10 = digits(n)
    # digits10 = digits!(tmp_digits[ndigits(n)], n)
    issymmetric(digits10) || return false
    digits2 = digits(n, base=2)
    # digits2 = digits!(tmp_digits[ndigits(n, base=2)], n, base=2)
    issymmetric(digits2) || return false
    return true
end

s = 0
@time for i in 1:M
    isdoublepalindrome(i) && (s += i)
end
s
ispalindrome(n) = (s = string(n); s == reverse(s))

N = 999
for i ∈ 0:100, k ∈ 0:i÷2
    a = N - (i-k)
    b = N - k
    c = a * b
    if ispalindrome(c)
        @show k, i-k, i
        @show a, b
        @show c
    end
end

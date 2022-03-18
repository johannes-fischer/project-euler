collatz(n) = n % 2 == 0 ? n ÷ 2 : 3n + 1

function collatz_seq!(x, n)
    push!(x, n)
    n == 1 && return x
    collatz_seq!(x, collatz(n))
    x
end

collatz_seq(n) = collatz_seq!(Int[], n)

# only dict works
collatz_lengths_dict = Dict(1 => 1)
collatz_lengths_arr = zeros(Int, 10_000_000_000)
collatz_lengths_arr[1] = 1

function collatz_length!(length_dict::Dict, n)
    if n ∉ keys(length_dict)
        length_dict[n] = collatz_length!(length_dict, collatz(n)) + 1
    end
    length_dict[n]
end

function collatz_length!(length_arr::Array, n)
    if length_arr[n] == 0
        length_arr[n] = collatz_length!(length_arr, collatz(n)) + 1
    end
    length_arr[n]
end

longest_chain_start = 1
longest_chain_length = 1
for n in 1:999999
    len = collatz_length!(collatz_lengths_dict, n)
    if len > longest_chain_length
        longest_chain_start = n
        longest_chain_length = len
    end
end

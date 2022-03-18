N = 1000
begin
    lettercount = zeros(Int, N)
    lettercount[1] = length("one")
    lettercount[2] = length("two")
    lettercount[3] = length("three")
    lettercount[4] = length("four")
    lettercount[5] = length("five")
    lettercount[6] = length("six")
    lettercount[7] = length("seven")
    lettercount[8] = length("eight")
    lettercount[9] = length("nine")
    lettercount[10] = length("ten")
    lettercount[11] = length("eleven")
    lettercount[12] = length("twelve")
    lettercount[13] = length("thirteen")
    lettercount[15] = length("fifteen")
    lettercount[18] = length("eighteen")
    lettercount[20] = length("twenty")
    lettercount[40] = length("forty")
end

function lettercount!(lookup::Array, number::Int)
    if lookup[number] != 0
        return lookup[number]
    end
    if 11 <= number < 20
        count = lettercount!(lookup, number - 10) + length("teen")
    elseif number < 100 && number % 10 == 0
        count = lettercount!(lookup, (number ÷ 10) + 10) - length("teen") + length("ty")
    elseif number < 100
        d, r = divrem(number, 10)
        count = lettercount!(lookup, 10 * d) + lettercount!(lookup, r)
    elseif number < 1000
        d, r = divrem(number, 100)
        count = lettercount!(lookup, d) + length("hundred")
        if r > 0
            count += length("and") + lettercount!(lookup, r)
        end
    elseif number < 10000
        d, r = divrem(number, 1000)
        count = lettercount!(lookup, d) + length("thousand")
        if r > 0
            count += lettercount!(lookup, r)
        end
    else
        error("Number $number too large")
    end
    lookup[number] = count
    count
end

s = sum(
    lettercount!(lettercount, i)
    for i in 1:1000
)
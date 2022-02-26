# istriplet(a,b,c) = a^2 + b^2 == c^2
aa=bb=cc = 0
for b in 1:1000, a in 1:b
    # istriplet(a,b,c) && break
    c = (sqrt(a^2 + b^2))
    try
        Int(c)
    catch e
        if e isa InexactError
            continue
        else
            rethrow()
        end
    end
    if a+b+c == 1000
        aa,bb,cc = a,b,Int(c)
        break
    end
end
@show aa,bb,cc
@show aa*bb*cc
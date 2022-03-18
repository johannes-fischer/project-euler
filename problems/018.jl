graph = Array{Int}[]

open("input/018/data.txt") do f
# open("input/067/triangle.txt") do f
    for s in eachline(f)
        push!(graph, parse.(Int, split(s)))
    end
end

ub = maximum(maximum.(graph))

N = length(graph)

function expand_node!(graph, open_nodes, closed_nodes, node)
    (i, j), (val, _) = node
    @assert i < N
    println("Expand node ($i,$j)")
    successor_nodes = []
    if i < N
        push!(successor_nodes, (i + 1, j))
        push!(successor_nodes, (i + 1, j + 1))
    end
    for (succ) in successor_nodes
        succ ∈ keys(closed_nodes) && continue
        succ_i, succ_j = succ
        succ_val = val - (N-i) * ub + graph[succ_i][succ_j] + (N - succ_i) * ub
        if succ ∉ keys(open_nodes) || succ_val > first(open_nodes[succ])
            open_nodes[succ] = (succ_val, j == succ_j)
        end
    end
    # delete!(open_nodes, (i,j))
    # closed_nodes[(i,j)] = (val, pre)
    sort!(open_nodes, byvalue = true, by = first)
end

# function next_node(open_nodes)
#     # value = -Inf
#     # next = nothing
#     # for (idx, (val, predecessor)) in open_nodes
#     #     if val > value
#     #         next = idx
#     #     end
#     # end
#     # return next
#     first(open_nodes)
# end

function path(node)
    while true
        (i,j), (val, pre) = node
        @show graph[i][j]
        isnothing(pre) && break
        node_idx = predecessor(node)
        node = node_idx => closed_nodes[node_idx]
    end
end

function predecessor(node)
    (i, j), (_, pre) = node
    pre ? (i - 1, j) : (i - 1, j - 1)
end



begin
    open_nodes = OrderedDict()
    open_nodes[(1, 1)] = (graph[1][1] + (N - 1) * ub, nothing)
    # open_nodes[(1, 2)] = (20, nothing)
    # open_nodes[(1, 3)] = (40, nothing)
    # open_nodes[(2, 1)] = (31, nothing)
    closed_nodes = Dict()


    while true
        next = pop!(open_nodes)
        @show next
        if first(first(next)) == N
            println("Expand node on final line")
            println("Sum value = $(last(next)[1])")
            # path(next)
            break
        end
        push!(closed_nodes, next)
        expand_node!(graph, open_nodes, closed_nodes, next)
    end
end
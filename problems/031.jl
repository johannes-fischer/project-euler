# coins = [200, 100, 50, 20, 10, 5, 2, 1]
coins = [1, 2, 5, 10, 20, 50, 100, 200]


function count_decompositions!(decompositions, budget, max_avail_coin_idx)
    if budget == 0
        decompositions[] += 1
    else
        for i in 1:max_avail_coin_idx
            remaining_budget = budget - coins[i]
            if remaining_budget >= 0
                count_decompositions!(decompositions, remaining_budget, i)
            else
                break
            end
        end
    end
end

decompositions = [0]
count_decompositions!(decompositions,200, 8)
decompositions
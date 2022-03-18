using Combinatorics

npaths(grid_size::Int) = multinomial(grid_size, grid_size)
npaths(20)
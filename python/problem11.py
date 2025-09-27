def function(file):
    f = open(file, "r").read()

    grid = [list(map(int, line.split())) for line in f.strip().split('\n')]
    rows, cols = len(grid), len(grid[0])

    max_product = 0
    for i in range(rows):
        for j in range(cols):
            if j <= cols - 4:
                product = grid[i][j] * grid[i][j+1] * grid[i][j+2] * grid[i][j+3]
                if max_product < product: max_product = product
            
            if i <= rows - 4:
                product = grid[i][j] * grid[i+1][j] * grid[i+2][j] * grid[i+3][j]
                if max_product < product: max_product = product

            if i <= rows - 4 and j <= cols - 4:
                product = grid[i][j] * grid[i+1][j+1] * grid[i+2][j+2] * grid[i+3][j+3]
                if max_product < product: max_product = product
            
            if i <= rows - 4 and j >= 3:
                product = grid[i][j] * grid[i+1][j-1] * grid[i+2][j-2] * grid[i+3][j-3]
                if max_product < product: max_product = product

    return max_product
        





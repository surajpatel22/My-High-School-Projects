grid = []
oldgrid = []
currentinput = ""

for i in range(int(input())):
    currentinput = input()
    grid.append(currentinput.split())
    oldgrid.append(currentinput.split())

loop = True



while loop:
    loop = False    
    for r, row in enumerate(grid):
        for i, index in enumerate(row):
            if (not i == 0) and index < row[i-1]:
                loop = True


            if (not r == 0) and index < grid[r-1][i]:
                loop = True

    if loop:



        for r, row in enumerate(grid):
            for i, index in enumerate(row):
                grid[r][i] = oldgrid[i][len(oldgrid)-1-r]
            

        for i in range(len(grid)):
            for r in range(len(grid)):
                currentinput = grid[i][r]
                oldgrid[i][r] = currentinput
        


for i in range(len(grid)):
    print (" ".join(grid[i]))


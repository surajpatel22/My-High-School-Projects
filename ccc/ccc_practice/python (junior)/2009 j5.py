
graph = {1 : [6],                   \
         2 : [6],                   \
         3 : [4, 15],               \
         4 : [3, 5, 6],             \
         5 : [3, 4, 6],             \
         6 : [1, 2, 3, 4, 5, 7],    \
         7 : [6, 8],                \
         8 : [7, 9],                \
         9 : [10, 11, 12],          \
         10: [9, 10],               \
         11: [10, 12],              \
         12: [9, 11, 13],           \
         13: [12, 14, 15],          \
         14: [13],                  \
         15: [3, 13],               \
         16: [17, 18],              \
         17: [16, 18],              \
         18: [18, 17]               }


def insert(node1, node2):
    
    if node1 not in graph:
        graph[node1] = [node2]
    if node2 not in graph:
        graph[node2] = [node1]
    if node2 not in graph[node1]:
        graph[node1].append(node2)
    if node1 not in graph[node2]:
        graph[node2].append(node1)


def delete(node1, node2):
    
    if node1 in graph[node2]:
        graph[node2].remove(node1)
        graph[node1].remove(node2)


def num(node1):
    print (len(graph[node1]))


def FofF(node):
    FofF = [node]
    count = 0

    for friend in graph[node]:
        FofF.append(friend)
        for friend in graph[friend]:
            if friend not in FofF:
                count += 1
                FofF.append(friend)
    print (count)


sep_exit = False
sep_count = 0
def seperation(node1, node2):

    arr = [node1]
    i = 0
    count = 0
    while node2 not in arr:
        for node in graph[arr[i]]:
            arr.append(node)
            
        
                
            
        
        
    
        

choice = ""

while not choice == "q":
    choice = input()
    if choice == "i":
        insert(int(input()), int(input()))
    elif choice == "d":
        delete(int(input()), int(input()))
    elif choice == "n":
        num(int(input()))
    elif choice == "f":
        FofF(int(input()))
    elif choice == "s":
        seperation(int(input()), int(input()))
        sep_exit = False
        sep_count = 0
    print (graph)
        



         

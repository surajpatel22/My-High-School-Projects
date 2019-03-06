
graph = {}
userinput = []
for i in range(int(input())):
    userinput = input()[1:].split()
    graph[str(i+1)] = userinput

print (graph)
      
reached = []


def recursion(start):

    reached.append(start)
    if start in graph:
        for node in graph[start]:
            recursion(node)
paths = []

def shortest(start, count):
    count += 1
    reached.append(start)
    if start in graph:
        for node in graph[start]:
            shortest(node, count)
    else:
        paths.append(count)
    


recursion("1")
n = False
for node in graph:
    if node not in reached:
        print ("n")
        n = True

if not n:
    print ("y")

shortest("1", 0)
paths.sort()
print (paths[-1])




    


    


graph = {}
userinput = []
for i in range(int(input())):
    userinput = input()[1:].split()
    graph[str(i+1)] = userinput

print (graph)
      
reached = []


def recursion(start):
    reached.append(start)
    if not graph[start] == []:
        for node in graph[start]:
            if not node in reached:
                recursion(node)
paths = []

def shortest(start, count):
    count += 1
    reached.append(start)
    end = True
    if not graph[start] == []:
        for node in graph[start]:
            if not node in reached:
                shortest(node, count)
                end = False
    else:
        paths.append(count)

print (graph)

recursion("1")
print (graph)
n = False
for node in graph:
    if node not in reached:
        print ("n")
        n = True

if not n:
    print ("y")

reached = []
shortest("1", 0)
paths.sort()
print (paths[-1])


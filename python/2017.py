

#input()
#sizes = input().split(" ")
sizes = "34 6 122 98 1".split(" ")
sizes = [int(i) for i in sizes]
sizes.sort()
print (sizes)

length = 0
combos = 0

for i in sizes:
    print (i)
    for j in sizes[..i]:

    for j in sizes[i+1..]

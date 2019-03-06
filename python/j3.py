distances = input().split()
for i in range(len(distances)):
    distances[i] = int(distances[i])

print (0, distances[0], distances[0] + distances[1], distances[0] + distances[1] + distances[2], distances[0] + distances[2] + distances[3] + distances[1])
print (distances[0], 0, distances[1], distances[1] + distances[2], distances[1] + distances[2] + distances[3])
print (distances[0] + distances[1], distances[1], 0, distances[2], distances[2] + distances[3])
print (distances[0] + distances[1] + distances[2], distances[1] + distances[2], distances[2], 0, distances[3])
print (distances[0] + distances[1] + distances[2] + distances[3], distances[1] + distances[2] + distances[3], distances[2] + distances[3], distances[3], 0)

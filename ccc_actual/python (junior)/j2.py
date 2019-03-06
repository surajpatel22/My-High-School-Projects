input()

spaces = []
for letter in input():
    if letter == "C":
        spaces.append(True)
    else:
        spaces.append(False)
        
count = 0

for i, letter in enumerate(input()):
    if letter == "C" and spaces[i] == True:
        count += 1

print (count)
        


def easy(original, current = ""):

    chars = []
    for letter in original:
        chars.append(letter)
    for letter in current:
        chars.remove(letter)
    if len(original) == len(current):
        print (current)
    else:
        for i in range(len(chars)):
            easy(original, current + chars[i])
        


easy("abc")
easy("aabc")


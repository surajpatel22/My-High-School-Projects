def two(n):
    if n == 1:
        return 1
    return n + two(n-1)

print(two(6))


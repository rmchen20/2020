numbers = [-2, 1, 7, -4, 5, 2, -3, -6, 4, 3, -8, -1, 6, -7, -9, -5]

maxsum = 0
maxstart = maxend = 0
newsum = 0

for end, n in enumerate(numbers):
    newsum += n

    if n > newsum:
        start = end
        newsum = n
    
    if newsum > maxsum:
        maxsum = newsum
        maxstart = start
        maxend = end

print("max Z value is from index", maxstart, "to", maxend, ":", maxsum)
print("subset:", numbers[maxstart:maxend+1])

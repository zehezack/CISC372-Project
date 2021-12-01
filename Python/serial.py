precision=2**31-1
result = 0
for i in range(1, precision, 4):
    result+=1.0/i
for i in range(3, precision, 4):
    result-=1.0/i

print(result*4)

from jug import TaskGenerator
from jug import mapreduce
import datetime

PRECISION = 2**32

@TaskGenerator
def inv(a):
    return 1.0/a

@TaskGenerator
def total(a, b):
    return a+b

@TaskGenerator
def write_output(r1, r2):
    with open('output.txt', 'at') as output:
        output.write("Result {}\n".format((r1-r2)*4))

with open('output.txt', 'at') as output:
    output.write("Start {}\n".format(datetime.datetime.now()))
result1 = mapreduce.mapreduce(total, inv, range(1,PRECISION,4), map_step=2**16)
result2 = mapreduce.mapreduce(total, inv, range(3,PRECISION,4), map_step=2**16)
with open('output.txt', 'at') as output:
    output.write("End {}\n".format(datetime.datetime.now()))
#    result1 = total(range(PRECISION))
#for n in range(3, PRECISION, 4):
#    result2 = mapreduce.map(inv, range(1,2**32,2), map_step=2**16)

write_output(result1,result2)
#print(result)

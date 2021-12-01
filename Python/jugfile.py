from jug import TaskGenerator
from jug import mapreduce
import datetime

PRECISION = 2**31-1

@TaskGenerator
def inv(a):
    return 1.0/a

@TaskGenerator
def total(a, b):
    return a+b

@TaskGenerator
def get_final_result(r1, r2):
    return (r1-r2)*4
result1 = mapreduce.mapreduce(total, inv, range(1,PRECISION,4), map_step=2**16)
result2 = mapreduce.mapreduce(total, inv, range(3,PRECISION,4), map_step=2**16)


final_result = get_final_result(result1, result2)

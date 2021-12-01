import ray
import datetime
import numpy as np
import sys

ray.init(num_cpus=int(sys.argv[1]))

PRECISION = 2**31-1
BATCH_SIZE = 2**16

@ray.remote
def inv_sum_remote(x,y,z):
    total=0
    for i in range(x+1,y,z*2):
        total+=1/i
    for i in range(x+3,y,z*2):
        total-=1/i
    return total

@ray.remote
def sum_remote(*result):
    return np.sum(result)

start = datetime.datetime.now()
inv_results = []
for i in range(1, PRECISION // BATCH_SIZE):
    inv_results.append(inv_sum_remote.remote((i-1)*BATCH_SIZE,i*BATCH_SIZE, 2))


#result1 = [inv_remote.remote(x) for x in range(3,2**20, 4)]

# print(ray.get(thing))
remote_final_sum = sum_remote.remote(*inv_results)
# print("Parallel Reduce result: {}".format(4*(ray.get(remote_final_sum1)-ray.get(remote_final_sum2))))
print("Parallel Reduce result: {}".format(4*ray.get(remote_final_sum)))
end = datetime.datetime.now()
print("end in {}".format(end-start))

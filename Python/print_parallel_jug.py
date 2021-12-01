import jug
jug.init('jugfile.py', 'jugfile.jugdata')
import jugfile
import datetime
#import sys
import os

#start = datetime.datetime.now()
result = jug.task.value(jugfile.final_result)
#end = datetime.datetime.now()

print("Result: {}".format(result))
#print("Start: {} \nResult: {} \nEnd: {} \n Delta".format(start, result, end, end-start))

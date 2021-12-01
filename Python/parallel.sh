#!/bin/bash

JUG=$(which jug)

SECONDS=0
echo "number of thread is " $1

for (( i=0; i<$1; i++ ))
do
    python $JUG execute jugfile.py &
done
python $JUG status jugfile.py
echo running with $1 threads
wait
duration=$SECONDS
date -u -d @"$duration" +'%-Mm %-Ss'
python print_parallel.py


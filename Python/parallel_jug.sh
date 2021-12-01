#!/bin/bash

PY=$(which python3) # python3 or pypy3
JUG=$(which jug)

SECONDS=0
echo "number of thread is " $1
echo python $PY
echo $JUG

for (( i=0; i<$1; i++ ))
do
    $PY $JUG execute jugfile.py &
done
$PY $JUG status jugfile.py
echo running with $1 threads
wait
duration=$SECONDS
date -u -d @"$duration" +'%-Mm %-Ss'
$PY print_parallel.py


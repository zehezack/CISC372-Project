#!/bin/bash

PY=$(which python3)

$PY parallel_ray.py 1
$PY parallel_ray.py 2
$PY parallel_ray.py 4
$PY parallel_ray.py 8
$PY parallel_ray.py 16

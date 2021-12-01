# CISC372-Project

CONTENTS OF THIS FILE
---------------------

 * Introduction
 * Requirements
 * Configuration
 * Troubleshooting
 * FAQ
 * Maintainers

INTRODUCTION
------------

The project is intended as to display different programming language processing speed with parallel and non-parallel programs, this will be measured with different core use and with different devices

REQUIREMENTS
------------

This module requires standard C, C++, Python library <br />
Code require access to bridges - 2 <br />
Code for C++ requires nvhpc/21.7, gprof, perf. <br />
Code for C requires nvhpc/21.7, gprof, perf. <br />
Code for Python requires <br />

CONFIGURATION
-------------

**INIT**
  Login to bridges - 2
  module load nvhpc/21.7

**Code for C++**

scp the content of C++ onto bridges2 <br />
```
scp -P 2222 *.sh *.cpp <name>@data.bridges2.psc.edu:~/372_fall2021/c++
```
Init the executables (Bridges2 must finish this step to proceed) <br />
```
sbatch INIT.sh
```
Running the code
```
sbatch ACC_CPU.sh
sbatch ACC_GPU.sh
sbatch OMP.sh
sbatch SERIAL.sh
```
Output folder contains already batched results for testing and checking <br />

**Code for C <br />**

scp the content of c onto bridges - 2 <br />
```
scp -P 2222 -r . name@data.bridges2.psc.edu:/jet/home/name/372_fall2021/ <br />
```
For getting all the executable needed for c (Note, bridges - 2 must finish this step to proceed to other) <br />
```
sbatch init <br />
```
For getting bench test for time <br />
```
//All time can be found by using more on the corresponding slurm file <br />
sbatch GPU-BENCH //This gets the time needed for OpenACC GPU <br />
sbatch CPU-BENCH //This gets the time needed for OpenACC CPU and OpenMP CPU for 2, 4, 8, 16 core, and Serial time <br />
```
For getting profile <br />
```
sbatch profile_script_CPU // result save format pi_OpenACC_core_nsys, this create Nsignt System profiling for OpenACC CPU <br />
sbatch profile_script_GPU // result save format pi_OpenACC_GPU_nsys, pi_OpenACC_GPU_ncu, this create Nsignt System and Nsight Compute profiling for OpenACC GPU <br />
sbatch profile_script_OMP // result save in corresponding slurm file, this create OpenMP profiler for CPU <br />
sbatch profile_script_Serial // result save in gprof_Serial_profiler, this create profiler for Serial code on C <br />
```
Output file contain all the already batched result for testing and checking porpuse. <br />

**Code for Python**
In the Python directory:
create and source a python virtualenv
```
python -m venv venv
source venv/bin/activate
```
Install the dependencies for jug and ray.
```
pip install jug
pip install ray
```

Running the code
```
./time_serial.sh
./time_jug.sh
./time_ray.sh
```

TROUBLESHOOTING
---------------

**Code for C++<br />**
Check if nvhpc/21.7 is loaded <br />
Otherwise, read the error messages.

**Code for C <br />**
If any thing display error, check if nvhpc/21.7 is loaded <br />

**Code for Python<br />**

FAQ
---

Waiting for class

MAINTAINERS
-----------

Current maintainers:
 * Zehe Zack Luan - zehezack@udel.edu
 * Alex You - youalex@udel.edu
 * JD Wang - jiandong@udel.edu 


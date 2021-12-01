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

This module requires standard C, C++, Python library
Code require access to bridges - 2
Code for C++ requires
Code for C requires nvhpc/21.7, gprof, perf.
Code for Python requires

CONFIGURATION
-------------

INIT
  Login to bridges - 2
  module load nvhpc/21.7

Code for C++

Code for C
  scp the content of c onto bridges - 2
    scp -P 2222 -r . name@data.bridges2.psc.edu:/jet/home/name/372_fall2021/
  For getting all the executable needed for c (Note, bridges - 2 must finish this step to proceed to other)
    sbatch init
  For getting bench test for time
    //All time can be found by using more on the corresponding .out file
    sbatch GPU-BENCH //This gets the time needed for OpenACC GPU
    sbatch CPU-BENCH //This gets the time needed for OpenACC CPU and OpenMP CPU for 2, 4, 8, 16 core, and Serial time
  For getting profile
    

Code for Python


TROUBLESHOOTING
---------------

To be written

FAQ
---

To be written

MAINTAINERS
-----------

Current maintainers:
 * Zehe Zack Luan - zehezack@udel.edu
 * Alex You - youalex@udel.edu
 * JD Wang - jiandong@udel.edu


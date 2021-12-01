#! /bin/bash
#SBATCH -A see200002p
#SBATCH -p RM-shared
#SBATCH -J job1
#SBATCH --mail-user=youalex@udel.edu
#SBATCH --mail-type=ALL

#SBATCH -N 1
#SBATCH -n 1

#SBATCH -t 00:05:00

nvc -Wall -pg pilieb_serial.cpp -o pilieb_serial_gprof
./pilieb_serial_gprof
./pilieb_serial_gprof
./pilieb_serial_gprof
./pilieb_serial_gprof
./pilieb_serial_gprof
gprof pilieb_serial_gprof gmon.out > serial_analysis.txt

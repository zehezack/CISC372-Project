#! /bin/bash
#SBATCH -A see200002p
#SBATCH -p RM-shared
#SBATCH -J myjob
#SBATCH -N 1
#SBATCH -n 16
#SBATCH -t 24:00:00

echo "Initializing executables for C++"

nvc pilieb_serial.cpp -o pilieb_serial_nvc
nvc -mp pilieb_mp.cpp -o pilieb_mp_nvc
nvc -acc -ta=tesla -Minfo=accel pilieb_acc.cpp -o pilieb_acc_nvc_GPU
nvc -acc -ta=multicore -Minfo=accel pilieb_acc.cpp -o pilieb_acc_nvc_cpu


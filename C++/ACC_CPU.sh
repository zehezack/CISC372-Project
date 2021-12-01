#! /bin/bash
#SBATCH -A see200002p
#SBATCH -p RM-shared
#SBATCH -J job1

#SBATCH -N 1
#SBATCH -n 16

#SBATCH -t 00:05:00

echo "Test ACC CPU 16 cores"
export ACC_NUM_CORES=16
./pilieb_acc_nvc_cpu
./pilieb_acc_nvc_cpu
./pilieb_acc_nvc_cpu
./pilieb_acc_nvc_cpu
./pilieb_acc_nvc_cpu
nsys profile -o pilieb_acc_CPU_16 --trace openacc ./pilieb_acc_nvc_cpu

echo "Test ACC CPU 8 cores"
export ACC_NUM_CORES=8
./pilieb_acc_nvc_cpu
./pilieb_acc_nvc_cpu
./pilieb_acc_nvc_cpu
./pilieb_acc_nvc_cpu
./pilieb_acc_nvc_cpu
nsys profile -o pilieb_acc_CPU_8 --trace openacc ./pilieb_acc_nvc_cpu

echo "Test ACC CPU 4 cores"
export ACC_NUM_CORES=4
./pilieb_acc_nvc_cpu
./pilieb_acc_nvc_cpu
./pilieb_acc_nvc_cpu
./pilieb_acc_nvc_cpu
./pilieb_acc_nvc_cpu
nsys profile -o pilieb_acc_CPU_4 --trace openacc ./pilieb_acc_nvc_cpu

echo "Test ACC CPU 2 cores"
export ACC_NUM_CORES=2
./pilieb_acc_nvc_cpu
./pilieb_acc_nvc_cpu
./pilieb_acc_nvc_cpu
./pilieb_acc_nvc_cpu
./pilieb_acc_nvc_cpu
nsys profile -o pilieb_acc_CPU_2 --trace openacc ./pilieb_acc_nvc_cpu



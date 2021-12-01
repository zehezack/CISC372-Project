#! /bin/bash
#SBATCH -A see200002p
#SBATCH -p GPU-shared
#SBATCH -J job1
#SBATCH --mail-user=youalex@udel.edu
#SBATCH --mail-type=ALL

#SBATCH --gpus=v100-32:4

#SBATCH -N 1
#SBATCH -n 4

#SBATCH -t 00:05:00

echo "nsys and ncu for ACC_GPU"
./pilieb_acc_nvc_GPU
./pilieb_acc_nvc_GPU
./pilieb_acc_nvc_GPU
./pilieb_acc_nvc_GPU
./pilieb_acc_nvc_GPU

nsys profile -o pilieb_acc_gpu_nsys --trace openacc ./pilieb_acc_nvc_GPU
ncu --set full -o pilieb_acc_gpu_ncu -f ./pilieb_acc_nvc_GPU

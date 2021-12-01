#! /bin/bash
#SBATCH -A see200002p
#SBATCH -p GPU-shared
#SBATCH -J job1
#SBATCH --mail-user=youalex@udel.edu
#SBATCH --mail-type=ALL

#SBATCH --gpus=v100-32:4

#SBATCH -N 1
#SBATCH -n 2

#SBATCH -t 00:05:00

./pilieb_acc_nvc_timed
./pilieb_acc_nvc_timed
./pilieb_acc_nvc_timed
./pilieb_acc_nvc_timed
./pilieb_acc_nvc_timed
nsys profile -o pilieb_acc_nvc_timed_2 --trace openacc ./pilieb_acc_nvc_timed

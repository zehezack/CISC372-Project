#! /bin/bash
#SBATCH -A see200002p
#SBATCH -p RM-shared
#SBATCH -J job1
#SBATCH --mail-user=youalex@udel.edu
#SBATCH --mail-type=ALL

#SBATCH -N 1
#SBATCH -n 16

#SBATCH -t 00:05:00

echo "C++ OMP with 16 threads"
export OMP_NUM_THREADS=16
./pilieb_mp_nvc
./pilieb_mp_nvc
./pilieb_mp_nvc
./pilieb_mp_nvc
./pilieb_mp_nvc

echo "C++ OMP with 8 threads"
export OMP_NUM_THREADS=8
./pilieb_mp_nvc
./pilieb_mp_nvc
./pilieb_mp_nvc
./pilieb_mp_nvc
./pilieb_mp_nvc

echo "C++ OMP with 4 threads"
export OMP_NUM_THREADS=4
./pilieb_mp_nvc
./pilieb_mp_nvc
./pilieb_mp_nvc
./pilieb_mp_nvc
./pilieb_mp_nvc

echo "C++ OMP with 2 threads"
export OMP_NUM_THREADS=2
./pilieb_mp_nvc
./pilieb_mp_nvc
./pilieb_mp_nvc
./pilieb_mp_nvc
./pilieb_mp_nvc



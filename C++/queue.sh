#! /bin/bash
#SBATCH -A see200002p
#SBATCH -p RM-shared
#SBATCH -J job1
#SBATCH --mail-user=youalex@udel.edu
#SBATCH --mail-type=ALL

#SBATCH -N 1
#SBATCH -n 1

#SBATCH -t 00:05:00

./pilieb_serial_nvc
./pilieb_serial_nvc
./pilieb_serial_nvc
./pilieb_serial_nvc
./pilieb_serial_nvc

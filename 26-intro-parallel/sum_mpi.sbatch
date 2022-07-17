#!/usr/bin/env bash
#SBATCH -o hello.out
#SBATCH -e hello.err
#SBATCH -t 00:01:00
#SBATCH -p cuda
#SBATCH -N 3
#SBATCH --mail-user=pdiehl@cct.lsu.edu

module load openmpi

srun python3.10 distributed_sum_mpi.py 

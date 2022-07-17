#!/usr/bin/env bash
#SBATCH -o hello.out
#SBATCH -e hello.err
#SBATCH -t 00:01:00
#SBATCH -p cuda
#SBATCH -N 2
#SBATCH --mail-user=pdiehl@cct.lsu.edu

module load openmpi

srun python3.10  hello_world_mpi.py 

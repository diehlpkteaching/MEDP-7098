#!/usr/bin/env bash

#SBATCH -o hostname_%j.out
#SBATCH -t 00:10:00
#SBATCH -p marvin
#SBATCH -N 1
#SBATCH -D /home/diehlpk/Compile/hpx-stable/build/bin
module load gcc/8.3.1s
module load boost/1.69.0-release
srun 1d_stencil_4 --np=12 --nd=5 --nx=100 

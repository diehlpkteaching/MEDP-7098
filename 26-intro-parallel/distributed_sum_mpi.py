from mpi4py import MPI
import sys


if __name__ == "__main__":
  size = MPI.COMM_WORLD.Get_size()
  rank = MPI.COMM_WORLD.Get_rank()
  comm = MPI.COMM_WORLD
  
  values = [1,2,3,4,5,6,7,8,9]

  partition = round(len(values)/size)

  sum = 0

  begin = rank * partition
  end = -1
  if rank == size-1:
      end = len(values)
  else:
      end = (rank+1) * partition

  for i in range(int(begin),int(end)):
      sum += values[i]
  
  if rank != 0 :
      req = comm.isend(sum,dest=0,tag=rank)
      req.wait()
  else:
      total_sum = 0
      data = []
      for i in range(1,size):
          data.append(comm.irecv(source=i,tag=i))
      for d in data: 
          total_sum += d.wait()
      total_sum += sum
      print(total_sum)

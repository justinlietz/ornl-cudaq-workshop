#!/bin/bash

# module purge
module load cuda/12.2.0
module load python/3.8-anaconda3
module -t list

# source /sw/ascent/python/3.8/anaconda-base/bin/deactivate

export PROJ=/gpfs/wolf2/olcf/trn024/proj-shared

source activate ${PROJ}/cudaq_env

# add cudaq bin to PATH
export PATH=$PATH:${PROJ}/install/cudaq-patch/bin
export CPATH=$CPATH:/sw/ascent/gcc/11.2.0-0/include/c++/11.2.0
export CPATH=$CPATH:/sw/ascent/gcc/11.2.0-0/include/c++/11.2.0/powerpc64le-unknown-linux-gnu
# add python bin to PATH
# export PATH=$PATH:/gpfs/wolf2/olcf/trn024/proj-shared/install/python/anaconda-base/bin

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/sw/ascent/gcc/11.2.0-0/lib64
# export LD_LIBRARY_PATH=/sw/ascent/gcc/11.2.0-0/lib64:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:${PROJ}/install/cudaq-patch/lib
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:${PROJ}/cuquantum-24.03.0.4/lib
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:${PROJ}/cutensor-2.0.1.2/lib
# export CUDAQ_MGPU_LIB_MPI=libmpi_ibm.so
export PYTHONPATH=$PYTHONATH:${PROJ}/install/cudaq-patch
export CUTENSORNET_COMM_LIB=/ccsopen/home/9b8/cuquantum-24.03.0.4/distributed_interfaces/libcutensornet_distributed_interface_mpi.so
export OLCF_CUDAQ_ROOT=${PROJ}/install/cudaq-patch

export CUDAQ_CLANG_EXTRA_ARGS=--gcc-toolchain=/sw/ascent/gcc/11.2.0-0
# export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/sw/ascent/gcc/11.2.0-0/lib64

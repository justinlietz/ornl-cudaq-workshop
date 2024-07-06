#BSUB -P TRN024
#BSUB -W 0:05
#BSUB -nnodes 1
#BSUB -alloc_flags gpudefault
#BSUB -J cudaq_py_nvidia
#BSUB -o cudaq_py_nvidia_%J.output
#BSUB -e cudaq_py_nvidia_%J.error

# module purge
# module load cudaq
# module load spectrum-mpi/10.4.0.3-20210112
module load cuda/12.2.0
module load python/3.8-anaconda3
module -t list

export PROJ=/gpfs/wolf2/olcf/trn024/proj-shared

source activate ${PROJ}/cudaq_env

# add cudaq bin to PATH
export PATH=$PATH:${PROJ}/install/cudaq-env/bin
export CPATH=$CPATH:/sw/ascent/gcc/11.2.0-0/include/c++/11.2.0
export CPATH=$CPATH:/sw/ascent/gcc/11.2.0-0/include/c++/11.2.0/powerpc64le-unknown-linux-gnu
# add python bin to PATH
# export PATH=$PATH:/gpfs/wolf2/olcf/trn024/proj-shared/install/python/anaconda-base/bin

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/sw/ascent/gcc/11.2.0-0/lib64
# export LD_LIBRARY_PATH=/sw/ascent/gcc/11.2.0-0/lib64:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:${PROJ}/install/cudaq-env/lib
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:${PROJ}/cuquantum-24.03.0.4/lib
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:${PROJ}/cutensor-2.0.1.2/lib
export PYTHONPATH=$PYTHONATH:${PROJ}/install/cudaq-env
export CUTENSORNET_COMM_LIB=/ccsopen/home/9b8/cuquantum-24.03.0.4/distributed_interfaces/libcutensornet_distributed_interface_mpi.so
export OLCF_CUDAQ_ROOT=${PROJ}/install/cudaq-env

export CUDAQ_CLANG_EXTRA_ARGS=--gcc-toolchain=/sw/ascent/gcc/11.2.0-0
# export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/sw/ascent/gcc/11.2.0-0/lib64

# Here we say give me 1 resource set (n), each
# with a single MPI rank (a), a single core (c), and a
# single GPU (1)
hostname
nvidia-smi
echo "PATH:"
echo $PATH
echo "LD_LIBRARY_PATH:"
echo $LD_LIBRARY_PATH
echo "PYTHONPATH"
echo $PYTHONPATH
echo "CONDA_DEFAULT_ENV"
echo $CONDA_DEFAULT_ENV

# jsrun -n 2 -a 1 -c 1 -g 4 hostname
# jsrun -n 2 -a 1 -c 1 -g 4 nvidia-smi
# jsrun -n 1 -a 1 -c 1 -g 1 echo $CONDA_DEFAULT_ENV
# jsrun -n 1 -a 1 -c 1 -g 1 nvidia-smi
# jsrun -n 4 -a 1 -c 1 -g 1 nvidia-smi
# jsrun -n 1 -a 1 -c 1 -g 4 nvidia-smi
jsrun -n 1 -a 1 -c 1 -g 4 python3 targets.py

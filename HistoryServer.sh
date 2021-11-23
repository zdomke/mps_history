#!/bin/bash
#This file has been copied & edited from the depreciated EicHistoryServer.
echo 'Starting History Server...'

# Set the conda environment
# Eval lets us avoid running conda init each time
if [ `hostname` == 'lcls-dev3' ]; then
  eval "$(conda shell.bash hook)"
  #source $TOOLS/script/ENVS64.bash
  conda activate mps-environment
fi
if [ `hostname` == 'PC94483' ]; then
  eval "$(conda shell.bash hook)"
  conda activate mps-environment
fi
# Test if the environment worked
echo "Conda environment activated: $CONDA_PREFIX"

#TODO: do I need this?
#current_db=$PHYSICS_TOP/mps_configuration/current
#files=`ls $current_db/mps_config*.db | grep -v runtime |  wc -l`

#TODO: Add one in for prod
if [ `hostname` == 'lcls-dev3' ]; then
  echo "lcls-dev3"
  #$PHYSICS_TOP/mps_history/start_history.py --port 3356 --dev
  export PYTHONPATH=$PYTHON_PATH:"/afs/slac/g/lcls/package/anaconda/2020.11/envs/mps-environment/bin/python":"/afs/slac.stanford.edu/u/cd/lking/mps/mps_database"
  python /u/cd/lking/mps/mps_history/mps_history/start_history.py --port 3356 --host lcls-dev3 --dev
fi
if [ `hostname` == 'PC94483' ]; then
  echo "test local"
  python start_history.py --port 3356  
fi


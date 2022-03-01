#!/bin/sh
# Author : Udit Gupta 
# Copyright : (VITION - BUY)

echo $0 "VITION init"
echo "Process Id:" $$

#activate virtualenv
echo ""
echo "activating virtualenv.."
conda activate env_VITION

#check if environment variable has length 0
if [ -z $CONDA_DEFAULT_ENV ]
then
#problem in setting virtual env
echo "Problem activating the virtual environment! exit"
else
#if virtual env successfully activated then show message
echo "Virtual Environment active at" $CONDA_DEFAULT_ENV
# WORK-------------------
echo ""
echo "installing dependencies..."
conda install -y pytorch torchvision cudatoolkit -c pytorch
pip install opencv-python torchgeometry
echo ""
echo "loading the model.."
sleep 2
echo "this might take a few minutes.."
sleep 5
timeout 5s python test.py --name sem8P1

#deactivate virtualenv
echo ""
echo "deactivating virtualenv"
conda deactivate
fi

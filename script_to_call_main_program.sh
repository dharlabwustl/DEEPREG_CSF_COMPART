#!/bin/bash
SESSION_ID=${1}
XNAT_USER=${2}
XNAT_PASS=${3}
TYPE_OF_PROGRAM=${4}
echo TYPE_OF_PROGRAM::${TYPE_OF_PROGRAM}
#export XNAT_HOST=${5} #'https://redcap.wustl.edu/redcap/api/' #
#echo ${REDCAP_API}
conda activate deepreg
if [[ ${TYPE_OF_PROGRAM} == 1 ]]; then
  echo " I AM HERE "
  ##/software/call_register_batch.sh ${SESSION_ID} $XNAT_USER $XNAT_PASS $XNAT_HOST
fi

##########################################################
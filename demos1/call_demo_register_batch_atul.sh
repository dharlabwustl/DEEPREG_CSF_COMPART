#!/usr/bin/env bash
counter=0
for x in demos/classical_mr_prostate_nonrigid/dataset/*.h5 ;
do 
thisfilename=$(basename ${x})
output_direname=${thisfilename%_h5data.h5*}

if [[ $counter -lt 1 ]] ; then 
echo ${output_direname}
echo ${thisfilename}
python demos/classical_mr_prostate_nonrigid/demo_register_batch_atul.py ${thisfilename} ${output_direname}
fi 
# counter=$(( counter + 1 ))
# echo $counter
done
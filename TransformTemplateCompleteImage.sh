#!/usr/bin/env bash

# export LSF_DOCKER_PRESERVE_ENVIRONMENT=TRUE
# LSF_DOCKER_VOLUMES="$HOME:$HOME /storage1/fs1/dharr/Active:/storage1/fs1/dharr/Active" 
# template file directory
template_dir='/storage1/fs1/dharr/Active/ATUL/PROJECTS/DOCKERIZE/templates'
template_file='scct_strippedResampled1.nii.gz'
template_file_path=${template_dir}/${template_file}
# BET file for the target CT:
BETfile_dir='/storage1/fs1/dharr/Active/ATUL/PROJECTS/NWU/DATA/LVO/output_directoryAugust192021/OUTPUT_42_82/BET_OUTPUT'
# directory of the inversetransform matrix
inv_matfile_dir='/storage1/fs1/dharr/Active/ATUL/PROJECTS/NWU/DATA/LVO/output_directoryAugust192021/OUTPUT_42_82/LINEAR_REGISTRATION_OUTPUT'
template_T_OUTPUT_dir='/storage1/fs1/dharr/Active/ATUL/PROJECTS/NWU/DATA/LVO/output_directoryAugust192021/OUTPUT_42_82/TEMPLATE_TRANS_OUTPUT'
mkdir -p ${template_T_OUTPUT_dir}
# for each Inversetransform file
for inv_file in ${inv_matfile_dir}/*Inv.mat ; 
do 
# echo ${inv_file}
inv_file_basename=$(basename ${inv_file})
betfilename=${inv_file_basename%_scct_strippedResampled1lin1Inv.mat}.nii.gz
echo $(ls ${BETfile_dir}/${betfilename} )
inv_transformmatrix_file=${inv_file}   
transformed_output_file=${template_T_OUTPUT_dir}/${template_file%.nii*}${betfilename}  #file_basename".nii.gz"
/usr/lib/fsl/5.0/flirt -in ${template_file_path} -ref ${BETfile_dir}/${betfilename} -out ${transformed_output_file} -init ${inv_transformmatrix_file} -applyxfm

echo " REGISTERED OUTPUT FILE "
echo $transformed_output_file
# # find the target scan file name
# # transform the template image and name it accordingly
done
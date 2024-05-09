#!/usr/bin/env bash
grayfile_dir='/storage1/fs1/dharr/Active/ATUL/PROJECTS/NWU/DATA/LVO/output_directoryAugust192021/OUTPUT_42_82/BET_OUTPUT'
deeplearningbase_Tr_dir='/storage1/fs1/dharr/Active/ATUL/PROJECTS/DeepReg/demos/classical_mr_prostate_nonrigid'
linearly_Tr_VentriMask_dir='/storage1/fs1/dharr/Active/ATUL/PROJECTS/NWU/DATA/LVO/output_directoryAugust192021/OUTPUT_42_82/TEMPLATE_TRANS_OUTPUT/'
# scct_strippedResampled1_onlyventricle_BWBJH_061_05082019_2339_Head_Spiral_3.0_J40s_2_3_levelset_brain_f.nii.gz
counter=0
for x in ${deeplearningbase_Tr_dir}/BJH_*levelset_brain_f ;
do
if [[ -d ${x} ]] && [[ $counter -lt 1 ]]; then
# ls $x
grayfile_path=${grayfile_dir}/${deeplearnoutputdirbase}.nii.gz
deeplearnoutputdirbase=$(basename ${x})
ventricleMask='scct_strippedResampled1_onlyventricle_BW'${deeplearnoutputdirbase}.nii.gz
ventricleMaskPath=${linearly_Tr_VentriMask_dir}/'scct_strippedResampled1_onlyventricle_BW'${deeplearnoutputdirbase}.nii.gz
# python runoncsfmask_batch_atul.py ${deeplearnoutputdirbase} ${ventricleMask}   ${linearly_Tr_VentriMask_dir}
if [[ -f  ${ventricleMaskPath} ]] && [[ -f $grayfile_path ]] ; then 
python runoncsfmask_batch_atul.py ${deeplearnoutputdirbase} ${ventricleMask}   ${linearly_Tr_VentriMask_dir} ${grayfile_path}
# counter=$(( counter+1 ))
echo ${counter}
fi
fi

done
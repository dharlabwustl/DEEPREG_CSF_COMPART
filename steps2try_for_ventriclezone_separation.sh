#!/bin/bash
# 0. BET the target and template CT.
template_CT='/storage1/fs1/dharr/Active/ATUL/PROJECTS/DeepReg/DATA/TEMPLATES/scct_strippedResampled1.nii.gz'
target_CT='/storage1/fs1/dharr/Active/ATUL/PROJECTS/DeepReg/DATA/TARGETS/SAH_1_01052014_2003_2.nii'
target_CT_BET='/storage1/fs1/dharr/Active/ATUL/PROJECTS/DeepReg/DATA/TARGETS/SAH_1_01052014_2003_2_resaved_levelset_brain_f.nii.gz'
# 1.Register CT to template using FSL rigid transformation
# 2.1.Register CT to template using deepreg non-rigid transformation
# 2.transform csf mask
# 3.get the regions of the transformed csf mask
# 4.limit the search area of the region growing by the bounding box obtained from step 3

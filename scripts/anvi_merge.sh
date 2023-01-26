#!/bin/bash
#SBATCH --nodes=1
#SBATCH --job-name=anvi_merge
#SBATCH --cpus-per-task=4
#SBATCH --mem=10G
#SBATCH --time=1:00:00
#SBATCH --output=anvi_merge.out
#SBATCH --error=anvi_merge.err
#SBATCH --partition=all
#SBATCH --reservation=biol217

#load your anvio environment (path needs to be adjusted)
module load miniconda3/4.7.12.1
#conda activate anvio
conda activate /home/sunam225/miniconda3/miniconda4.9.2/usr/etc/profile.d/conda.sh/envs/anvio-7.1
#conda activate /home/sunam226/.conda/envs/anvio
#source activate /home/sunam226/miniconda3/miniconda4.9.2/usr/etc/profile.d/conda.sh/envs/anvio-7.1
#Move to folder
cd /work_beegfs/sunam230/day3/anvio_profile
#create output folder:
#mkdir -p merged_profiles
#Merging Anvi’o Profiles
anvi-merge ./BGR_130305/PROFILE.db ./BGR_130527/PROFILE.db ./BGR_130708/PROFILE.db -o ./merged_profiles -c ../contigsDB/contigs.db --enforce-hierarchical-clustering
#anvi-merge /PATH/TO/SAMPLE1/PROFILE.db /PATH/TO/SAMPLE2/PROFILE.db /PATH/TO/SAMPLE3/PROFILE.db -o /PATH/TO/merged_profiles -c /PATH/TO/contigs.db --enforce-hierarchical-clustering
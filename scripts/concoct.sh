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
#binning with concoct
anvi-cluster-contigs -p /merged_profiles/PROFILE.db -c ../contigsDB/contigs.db -C CONCOCT --driver concoct --just-do-it
#and summarize
anvi-summarize -p /merged_profiles/PROFILE.db -c ../contigsDB/contigs.db -o SUMMARY_CONCOCT -C CONCOCT
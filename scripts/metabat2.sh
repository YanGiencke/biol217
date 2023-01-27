#!/bin/bash
#SBATCH --nodes=1
#SBATCH --job-name=metabat2
#SBATCH --cpus-per-task=4
#SBATCH --mem=10G
#SBATCH --time=1:00:00
#SBATCH --output=metabat2.out
#SBATCH --error=metabat2.err
#SBATCH --partition=all
#SBATCH --reservation=biol217

#load your anvio environment (path needs to be adjusted)
module load miniconda3/4.7.12.1
#conda activate anvio
conda activate /home/sunam225/miniconda3/miniconda4.9.2/usr/etc/profile.d/conda.sh/envs/anvio-7.1
#conda activate /home/sunam226/.conda/envs/anvio
#Move to folder
cd /work_beegfs/sunam230/day3/anvio_profile
#binning with metabat2
anvi-cluster-contigs -p /merged_profiles/PROFILE.db -c ../contigsDB/contigs.db -C METABAT --driver metabat2 --just-do-it --log-file log-metabat2
#and summarize
anvi-summarize -p /merged_profiles/PROFILE.db -c ../contigsDB/contigs.db -o SUMMARY_METABAT -C METABAT
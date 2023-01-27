#!/bin/bash
#SBATCH --nodes=1
#SBATCH --job-name=sort_index_binning
#SBATCH --cpus-per-task=4
#SBATCH --mem=10G
#SBATCH --time=1:00:00
#SBATCH --output=sort_index_binning.out
#SBATCH --error=sort_index_binning.err
#SBATCH --partition=all
#SBATCH --reservation=biol217

#load your anvio environment (path needs to be adjusted)
module load miniconda3/4.7.12.1
#conda activate anvio
#conda activate /home/sunam226/.conda/envs/anvio
conda activate /home/sunam225/miniconda3/miniconda4.9.2/usr/etc/profile.d/conda.sh/envs/anvio-7.1
#source activate /home/sunam226/miniconda3/miniconda4.9.2/usr/etc/profile.d/conda.sh/envs/anvio-7.1
#create output folder:
cd /work_beegfs/sunam230/day3/mapping_out/
#mkdir -p mapping_out
#Sort and Index bam files
for i in *.bam
	do anvi-init-bam "$i" -o "$i".sorted.bam
done
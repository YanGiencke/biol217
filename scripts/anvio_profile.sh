#!/bin/bash
#SBATCH --nodes=1
#SBATCH --job-name=anvio_profile
#SBATCH --cpus-per-task=4
#SBATCH --mem=10G
#SBATCH --time=1:00:00
#SBATCH --output=anvio_profile.out
#SBATCH --error=anvio_profile.err
#SBATCH --partition=all
#SBATCH --reservation=biol217

#load your anvio environment (path needs to be adjusted)
module load miniconda3/4.7.12.1
#conda activate anvio
conda activate /home/sunam225/miniconda3/miniconda4.9.2/usr/etc/profile.d/conda.sh/envs/anvio-7.1
#conda activate /home/sunam226/.conda/envs/anvio
#source activate /home/sunam226/miniconda3/miniconda4.9.2/usr/etc/profile.d/conda.sh/envs/anvio-7.1
#create output folder:
cd /work_beegfs/sunam230/day3/mapping_out/
mkdir -p ../anvio_profile
#Creating an Anvi’o Profile
for i in `ls *.sorted.bam | cut -d "." -f 1`;
	do anvi-profile -i "$i".bam.sorted.bam.sorted.bam -c ../contigsDB/contigs.db -o ../anvio_profile/”$i”; done
#!/bin/bash
#SBATCH --nodes=1
#SBATCH --job-name=bowtie2_build
#SBATCH --cpus-per-task=4
#SBATCH --mem=10G
#SBATCH --time=1:00:00
#SBATCH --output=bowtie2_build.out
#SBATCH --error=bowtie2_build.err
#SBATCH --partition=all
#SBATCH --reservation=biol217

#load your anvio environment (path needs to be adjusted)
module load miniconda3/4.7.12.1
#conda activate anvio
conda activate /home/sunam226/.conda/envs/anvio
#source activate /home/sunam226/miniconda3/miniconda4.9.2/usr/etc/profile.d/conda.sh/envs/anvio-7.1
#load bowtie2
module load bowtie2
#move to your working directory
cd /work_beegfs/sunam230/day3
#create output folder:
mkdir -p mapping_out
#Indexing of fasta file
bowtie2-build ./mapping_out/contigs.anvio.fa ./mapping_out/contigs.anvio.fa.index
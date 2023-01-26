#!/bin/bash
#SBATCH --nodes=1
#SBATCH --job-name=mapping
#SBATCH --cpus-per-task=4
#SBATCH --mem=10G
#SBATCH --time=1:00:00
#SBATCH --output=mapping.out
#SBATCH --error=mapping.err
#SBATCH --partition=all
#SBATCH --reservation=biol217

#load your anvio environment (path needs to be adjusted)
module load miniconda3/4.7.12.1
#conda activate anvio
conda activate /home/sunam226/.conda/envs/anvio
#source activate /home/sunam226/miniconda3/miniconda4.9.2/usr/etc/profile.d/conda.sh/envs/anvio-7.1
#load bowtie2
module load bowtie2
#create output folder:
cd /work_beegfs/sunam230/day3
mkdir -p mapping_out
#Genomes Mapping
bowtie2-build ./mapping_out/contigs.anvio.fa ./mapping_out/contigs.anvio.fa.index
#!/bin/bash

#SBATCH --nodes=1
#SBATCH --cpus-per-task=10
#SBATCH --mem=600M
#SBATCH --time=00:05:00

#SBATCH -D ./
#SBATCH --output=./similarity.out
#SBATCH --error=./similarity.out
#SBATCH --partition=all

# for pangenome
conda activate /home/sunam225/miniconda3/miniconda4.9.2/usr/etc/profile.d/conda.sh/envs/anvio-7.1

# set working directory by navigating there
cd /work_beegfs/sunam230/Day6/03_pangenome/

# Insert your command here 
# Compute genome similarity
anvi-compute-genome-similarity --external-genomes ../02_contigs-dbs/new_external-genomes.txt --output-dir ./similarity --num-threads 10 --pan-db pangenome-PAN.db
# provides information on resource requirements as stdout
jobinfo


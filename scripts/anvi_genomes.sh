#!/bin/bash

#SBATCH --nodes=1
#SBATCH --cpus-per-task=10
#SBATCH --mem=500M
#SBATCH --time=00:05:00

#SBATCH -D ./
#SBATCH --output=./pan_genome.out
#SBATCH --error=./pan_genome.out
#SBATCH --partition=all

# for pangenome
conda activate /home/sunam225/miniconda3/miniconda4.9.2/usr/etc/profile.d/conda.sh/envs/anvio-7.1

# set working directory by navigating there
cd /work_beegfs/sunam230/Day6/02_contigs-dbs/

# Insert your command here 
# Combine genome databases
anvi-gen-genomes-storage -e new_external-genomes.txt  -o ../03_pangenome/combined-GENOMES.db
# Make pan genome
anvi-pan-genome -g ../03_pangenome/combined-GENOMES.db --project-name pangenome --num-threads 10 -o ../03_pangenome

# provides information on resource requirements as stdout
jobinfo


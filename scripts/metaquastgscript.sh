#!/bin/bash
#SBATCH --nodes=1
#SBATCH --job-name=metaquast
#SBATCH --cpus-per-task=4
#SBATCH --mem=10G
#SBATCH --time=1:00:00
#SBATCH --output=metaquast.out
#SBATCH --error=metaquast.err
#SBATCH --partition=all
#SBATCH --reservation=biol217

#load your anvio environment (path needs to be adjusted)
module load miniconda3/4.7.12.1
#conda activate anvio
conda activate /home/sunam226/.conda/envs/anvio
#source activate /home/sunam226/miniconda3/miniconda4.9.2/usr/etc/profile.d/conda.sh/envs/anvio-7.1
#create output folder:
cd /work_beegfs/sunam230/day3
mkdir ./3_metaquast_out
#to execute in for loop:
#Quality Assessment of Assemblies
metaquast -t 6 -o ./3_metaquast_out -m 1000 ./3_coassembly/final.contigs.fa
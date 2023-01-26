#!/bin/bash
#SBATCH --nodes=1
#SBATCH --job-name=assembly
#SBATCH --cpus-per-task=4
#SBATCH --mem=10G
#SBATCH --time=1:00:00
#SBATCH --output=assembly.out
#SBATCH --error=assembly.err
#SBATCH --partition=all
#SBATCH --reservation=biol217

#load your anvio environment (path needs to be adjusted)
#module load miniconda3/4.7.12.1
#conda activate anvio
#conda activate /home/sunam226/.conda/envs/anvio
#source activate /home/sunamXXX/miniconda3/miniconda4.9.2/usr/etc/profile.d/conda.sh/envs/anvio-7.1
#create output folder:
#mkdir ./assembly_out
#to execute in for loop:
#assembly
cd /work_beegfs/sunam230/day2/fastp_out/
                                       
megahit -1 BGR_130305_R1.fastq.gz -1 BGR_130527_R1.fastq.gz -1 BGR_130708_R1.fastq.gz -2 BGR_130305_R2.fastq.gz -2 BGR_130527_R2.fastq.gz -2 BGR_130708_R2.fastq.gz --min-contig-len 1000 --presets meta-large -m 0.85 -o ../3_coassembly/"$i" -t 20 

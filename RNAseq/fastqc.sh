#!/bin/bash

#SBATCH --nodes=1
#SBATCH --cpus-per-task=10
#SBATCH --mem=12G
#SBATCH --time=00:30:00

#SBATCH -D ./
#SBATCH --output=./fastqc.out
#SBATCH --error=./fastqc.out
#SBATCH --partition=all

# module load miniconda3
module load miniconda3/4.7.12.1

# for RNA seq
conda activate /home/sunam226/.conda/envs/grabseq

# set working directory by navigating there
mkdir -p /work_beegfs/sunam230/RNASeq/fastqc
cd /work_beegfs/sunam230/RNASeq/data

# Insert your command here 
# fastqc
for i in *.fastq; do fastqc $i -o /work_beegfs/sunam230/RNASeq/fastqc; done

# To combine all the fastqc reports into one html file
multiqc /work_beegfs/sunam230/RNASeq/fastqc -o /work_beegfs/sunam230/RNASeq/fastqc

# provides information on resource requirements as stdout
jobinfo

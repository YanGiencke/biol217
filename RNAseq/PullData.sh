#!/bin/bash

#SBATCH --nodes=1
#SBATCH --cpus-per-task=10
#SBATCH --mem=500M
#SBATCH --time=00:10:00

#SBATCH -D ./
#SBATCH --output=./PullData.out
#SBATCH --error=./PullData.out
#SBATCH --partition=all

# module load miniconda3
module load miniconda3/4.7.12.1

# for RNA seq
conda activate /home/sunam226/.conda/envs/grabseq

# set working directory by navigating there
mkdir -p /work_beegfs/sunam230/RNASeq/data
cd /work_beegfs/sunam230/RNASeq/data

# Insert your command here 
# Download just the fastq files
fasterq-dump SRR4018514 SRR4018515 SRR4018516 SRR4018517
# Download just the metadata
#grabseqs sra -l -t 10 -m metadata.csv -o /work_beegfs/sunam230/RNASeq/data/metadata.csv SRP081251
# Download the whole project
#grabseqs sra SRP081251
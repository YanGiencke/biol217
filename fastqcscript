#!/bin/bash
#SBATCH --nodes=1
#SBATCH --job-name=fastqc
#SBATCH --cpus-per-task=4
#SBATCH --mem=10G
#SBATCH --time=1:00:00
#SBATCH --output=fastqc.out
#SBATCH --error=fastqc.err
#SBATCH --partition=all
#SBATCH --reservation=biol217

#grab input folder and move it to working directory
#cp -r origin_folder/ own_working_folder/
cp -r /home/sunam226/Day2/0_raw_reads/ /work_beegfs/sunam230/day2/
#be sure to move into to working directory (were input folder is located)
#cd /work_beegfs/sunam230/day2/
#load your anvio environment (path needs to be adjusted)
module load miniconda3/4.7.12.1
#conda activate anvio
conda activate /home/sunam226/.conda/envs/anvio
#source activate /home/sunamXXX/miniconda3/miniconda4.9.2/usr/etc/profile.d/conda.sh/envs/anvio-7.1
#load fastqc
module load fastqc
#create output folder:
#mkdir fastqc_out
#to execute in for loop:
#for i in input_folder/*.gz; do fastqc $i -o output_folder/; done
for i in ./0_raw_reads/*.gz; do fastqc $i -o ./fastqc_out/; done

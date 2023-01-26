#!/bin/bash
#SBATCH --nodes=1
#SBATCH --job-name=fastp
#SBATCH --cpus-per-task=4
#SBATCH --mem=10G
#SBATCH --time=1:00:00
#SBATCH --output=fastp.out
#SBATCH --error=fastp.err
#SBATCH --partition=all
#SBATCH --reservation=biol217

#grab input folder and move it to working directory
#cp -r origin_folder/ own_working_folder/
#be sure to move into to working directory (were input folder is located)
#cd /work_beegfs/sunam230/day2/
#load your anvio environment (path needs to be adjusted)
#conda activate anvio
#source activate /home/sunamXXX/miniconda3/miniconda4.9.2/usr/etc/profile.d/conda.sh/envs/anvio-7.1
#to execute in for loop:
#change directory
cd 0_raw_reads/
#create output folder:
mkdir ../fastp_out
#fastp
for i in `ls *_R1.fastq.gz`;
do
    second=`echo ${i} | sed 's/_R1/_R2/g'`
    fastp -i ${i} -I ${second} -R ../fastp_out/"${i}"_report -o ../fastp_out/"${i}" -O ../fastp_out/"${second}" -t 6 -q 20

done
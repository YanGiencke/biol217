#!/bin/bash
#SBATCH --nodes=1
#SBATCH --job-name=sam2bam
#SBATCH --cpus-per-task=4
#SBATCH --mem=10G
#SBATCH --time=1:00:00
#SBATCH --output=sam2bam.out
#SBATCH --error=sam2bam.err
#SBATCH --partition=all
#SBATCH --reservation=biol217

#load your anvio environment (path needs to be adjusted)
module load miniconda3/4.7.12.1
#conda activate anvio
conda activate /home/sunam226/.conda/envs/anvio
#source activate /home/sunam226/miniconda3/miniconda4.9.2/usr/etc/profile.d/conda.sh/envs/anvio-7.1
#load samtools
module load samtools
#move to input folder
cd /work_beegfs/sunam230/day3/mapping_out/
#Converting sam files to bam
for i in *.sam; 
    do samtools view -bS $i > "$i".bam; 
done

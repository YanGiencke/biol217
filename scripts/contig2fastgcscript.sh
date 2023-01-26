#!/bin/bash
#SBATCH --nodes=1
#SBATCH --job-name=contig2fastg
#SBATCH --cpus-per-task=4
#SBATCH --mem=10G
#SBATCH --time=1:00:00
#SBATCH --output=contig2fastg.out
#SBATCH --error=contig2fastg.err
#SBATCH --partition=all
#SBATCH --reservation=biol217

#be sure to move into to working directory (were input folder is located)
cd /work_beegfs/sunam230/day2//3_coassembly/
#load your anvio environment (path needs to be adjusted)
module load miniconda3/4.7.12.1
#conda activate anvio
conda activate /home/sunam226/.conda/envs/anvio
#source activate /home/sunamXXX/miniconda3/miniconda4.9.2/usr/etc/profile.d/conda.sh/envs/anvio-7.1
#Convert contig to fastg
megahit_toolkit contig2fastg 99 final.contigs.fa > final.contigs.fastg
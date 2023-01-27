#!/bin/bash
#SBATCH --nodes=1
#SBATCH --job-name=gunc
#SBATCH --cpus-per-task=4
#SBATCH --mem=10G
#SBATCH --time=1:00:00
#SBATCH --output=gunc.out
#SBATCH --error=gunc.err
#SBATCH --partition=all
#SBATCH --reservation=biol217

#load your anvio environment (path needs to be adjusted)
module load miniconda3/4.7.12.1
#activate gunc
conda activate /home/sunam226/.conda/envs/gunc
#change dir
cd /work_beegfs/sunam230/Day5/5_anvio_profiles/ARCHAEA_BIN_REFINEMENT
#create dir
mkdir GUNC
#run gunc
for i in *.fa; 
    do gunc run -i "$i" -r /home/sunam226/Databases/gunc_db_progenomes2.1.dmnd --out_dir GUNC --threads 10 --detailed_output; 
done
#!/bin/bash
#SBATCH --nodes=1
#SBATCH --job-name=anvi_merge
#SBATCH --cpus-per-task=4
#SBATCH --mem=10G
#SBATCH --time=1:00:00
#SBATCH --output=anvi_merge.out
#SBATCH --error=anvi_merge.err
#SBATCH --partition=all

path=""
for i in *;
    do path += "$i/PROFILE.db ";
done
echo "$path"
#anvi-merge "${path}"" -o /merged_profiles -c ../contigsDB/contigs.db --enforce-hierarchical-clustering



conda install -c bioconda bioconductor-deseq2 -y
conda install -c bioconda segemehl -y
conda install -c r r-gplots -y
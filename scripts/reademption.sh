#!/bin/bash
#SBATCH --job-name=reademption
#SBATCH --output=reademption.out
#SBATCH --error=reademption.err
#SBATCH --nodes=1
#SBATCH --tasks-per-node=1
#SBATCH --cpus-per-task=4
#SBATCH --mem=32G
#SBATCH --qos=long
#SBATCH --time=0-05:00:00
#SBATCH --partition=all
#SBATCH --export=NONE
#SBATCH --reservation=biol217

source ~/.bashrc

#activating conda
module load miniconda3/4.7.12.1
module load python/3.7.4
conda activate /home/sunam226/.conda/envs/reademption
reademption align --fastq -p 4 --poly_a_clipping --project_path READemption_analysis
reademption coverage -p 4 --project_path READemption_analysis
reademption gene_quanti -p 4 --features CDS,tRNA,rRNA --project_path READemption_analysis
reademption deseq -l sRNA_R1.fa,sRNA_R2.fa,wt_R1.fa,wt_R2.fa -c sRNA,sRNA,wt,wt -r 1,2,1,2 --libs_by_species methanosarcina=sRNA_R1,sRNA_R2,wt_R1,wt_R2 --project_path READemption_analysis
reademption viz_align --project_path READemption_analysis
reademption viz_gene_quanti --project_path READemption_analysis
reademption viz_deseq --project_path READemption_analysis
conda deactivate
jobinfo
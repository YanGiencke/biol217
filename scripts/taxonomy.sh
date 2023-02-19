#!/bin/bash
#SBATCH --nodes=1
#SBATCH --job-name=taxonomy
#SBATCH --cpus-per-task=4
#SBATCH --mem=10G
#SBATCH --time=1:00:00
#SBATCH --output=taxonomy.out
#SBATCH --error=taxonomy.err
#SBATCH --partition=all
#SBATCH --reservation=biol217

#load your anvio environment (path needs to be adjusted)
module load miniconda3/4.7.12.1
#conda activate anvio
conda activate /home/sunam225/miniconda3/miniconda4.9.2/usr/etc/profile.d/conda.sh/envs/anvio-7.1
#conda activate /home/sunam226/.conda/envs/anvio
#source activate /home/sunam226/miniconda3/miniconda4.9.2/usr/etc/profile.d/conda.sh/envs/anvio-7.1
#Move to folder
cd /work_beegfs/sunam230/Day5/5_anvio_profiles/
#taxonomy annotation
#associate the single-copy core genes in your contigs-db with taxnomy information
anvi-run-scg-taxonomy -c /work_beegfs/sunam230/Day5/contigs.db -T 20 -P 2
#estimate annotation Genes
anvi-estimate-scg-taxonomy -c /work_beegfs/sunam230/Day5/contigs.db --metagenome-mode
#estimate Ribosomal RNAs
anvi-estimate-scg-taxonomy -c /work_beegfs/sunam230/Day5/contigs.db --metagenome-mode --compute-scg-coverages --update-profile-db-with-taxonomy > temp.txt
#summarize the data
anvi-summarize -p merged_profiles/PROFILE.db -c /work_beegfs/sunam230/Day5/contigs.db -o SUMMARY_consolidated_bins/ -C consolidated_bins
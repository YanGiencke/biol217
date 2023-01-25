# Sequencing Pipeline

By utilizing batch scripts to run the pipeline on a cluster, it is possible to run commands on multiple samples at the same time. The resources provided by the cluster decrease the time it takes to run the scripts significantly.

## Cluster
The cluster is a high performance computer linked to the internet, it is used to run computationally intensive programs. To use the cluster, you need to connect to it using a terminal. Then you can run commands on the cluster, for example Bash scripts. The commands are sent to the cluster and the cluster runs the commands. The results are then sent back to your computer. 
Important commands:
- `ssh -X username@clustername` - Connect to the cluster
- `sbatch batch_name` - Run a Batch script on the cluster
- `squeue -u username` - Check the status of the jobs on the cluster
- `scancel job_id` - Cancel a job on the cluster

## Batch scripts
Batch scripts are Bash scripts that are run on the cluster. The scripts are used to run commands on multiple samples at the same time. The Format is `script_name.sh`. 


## Overview
1. Raw data
2. Quality control / cleanup
3. Assembly
4. Binning
5. Quality assessment



## 1. Raw data
- Raw data is the output from the sequencer.
- File format **FASTQ** (example file: SRR2584869_1.fastq.gz)
- The file contains four lines for each DNA fragment:
  -  The first line contains the fragment ID. 
  -  The second line contains the DNA sequence. 
  -  The third line contains the ID of the fragment again. 
  -  The fourth line contains the quality score for each nucleotide in the DNA sequence. The quality score is a number between 0 and 40. The higher the number, the higher the quality of the nucleotide. The quality score is calculated by the sequencer. The quality score is used to filter out low quality nucleotides.
- Input: DNA fragments


## 2. Quality control / cleanup
- The quality of the DNA fragments is checked.
- The DNA fragments are trimmed to remove low quality nucleotides.
- The DNA fragments are filtered to remove fragments with too many low quality nucleotides.
- Input: fastq file
- Command: fastqc
- Output: fastqc report

## 3. Assembly
- The DNA fragments are assembled into contigs.
- The contigs are sorted by length.
- The contigs are clustered into bins.

## 4. Binning
- The contigs are clustered into bins.
- Two methods:
  -   Refference based
  -   De-Novo

## 5. Quality assessment
- The quality of the bins is assessed.
- The bins are sorted by quality.

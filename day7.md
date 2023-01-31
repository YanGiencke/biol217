# RNA-Seq

## Central dogma
DNA -> RNA -> Protein
   - DNA: deoxyribonucleic acid (genetic material)
   - RNA: ribonucleic acid (messenger)
   - Protein: amino acid chain (functional)

## RNA-Seq
RNA-Seq is a method to sequence RNA. It is based on the principle of sequencing by synthesis. The RNA is fragmented into small pieces and the fragments are attached to a flow cell. The flow cell is then placed in a sequencing machine. The sequencing machine uses a laser to read the RNA fragments. The laser reads the RNA fragments by reading the fluorescent signal of the attached nucleotides. The nucleotides are attached to the RNA fragments in a specific order. The order of the nucleotides is determined by the sequence of the RNA fragment. The order of the nucleotides is read by the sequencing machine and the sequence of the RNA fragment is determined. The RNA fragments are then sequenced in parallel. The sequencing machine can read millions of RNA fragments in parallel. The RNA fragments are read in a specific order.
- optimal read length: 50 bp single end, 100 bp paired end
- optimal replicate number: 3-5


## RNA-Seq workflow
1. Extract RNA
2. Produce cDNA
3. Sequencing
4. Bioinformatics
5. Analysis

## Extract RNA
- RNA is extracted from cells

## Produce cDNA
- cDNA is produced from RNA using reverse transcription

## Illumina sequencing
Illumina sequencing is a method to sequence DNA or RNA. It is based on the principle of sequencing by synthesis. The DNA or RNA is fragmented into small pieces and the fragments are attached to a flow cell. The flow cell is then placed in a sequencing machine. The sequencing machine uses a laser to read the DNA or RNA fragments. The laser reads the DNA or RNA fragments by reading the fluorescent signal of the attached nucleotides. The nucleotides are attached to the DNA or RNA fragments in a specific order. The order of the nucleotides is determined by the sequence of the DNA or RNA fragment. The order of the nucleotides is read by the sequencing machine and the sequence of the DNA or RNA fragment is determined. The DNA or RNA fragments are then sequenced in parallel. The sequencing machine can read millions of DNA or RNA fragments in parallel. The DNA or RNA fragments are read in a specific order. The order of the DNA or RNA fragments is determined by the order of the nucleotides. The order of the nucleotides is determined by the sequence of the DNA or RNA fragment. The order of the DNA or RNA fragments is determined by the order of the nucleotides.


## Download sequencing data from papers
- Go to paper
- Search for key words (SRA, SRR, accession number)
- Follow link to NCBI SRA (https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE85456)
- Navigate to SRA and extract SRR numbers of interest
- Import the data into your computer with the following command:
```
fasterq-dump SRR***, SRR***, SRR***, SRR***
```

- SRR numbers 
  - SRR4018517
  - SRR4018516
  - SRR4018515
  - SRR4018514


## [Bioinformatics pipeline](Sequencing_pipeline.md)
1. Quality control / Trimming
2. Assembly
3. Binning
4. Quality assessment
5. Taxonomic classification


Bioinformatics pipeline using READemption
```
# Activate conda environment
conda activate /home/sunam226/.conda/envs/reademption/

# Create output directories
reademption create --project_path READemption_analysis --species methanosarcina="Methanosarcina Mazei"

# Load the data
fasterq-dump SRR4018514 SRR4018515 SRR4018516 SRR4018517
#wget "from source"
#cp ../data/* READemption_analysis/input/reads/

# Search on NCBI for Methanosarcina mazei genome (https://www.ncbi.nlm.nih.gov/genome/?term=Methanosarcina%20mazei%20go1)
# Download the reference genome into reference folder (.fasta) and annotation into annotation folder (.gff3) from NCBI (https://www.ncbi.nlm.nih.gov/nuccore/NC_003901.1?report=fasta)

# Make sure all files have the same header (NC_003901.1)

# Run the batch script
```


### 1. Quality control
Check the quality of the data with fastqc
```
# fastqc
for i in *.fastq; do fastqc $i -o /work_beegfs/sunam230/RNASeq/fastqc; done

# To combine all the fastqc reports into one html file
multiqc /work_beegfs/sunam230/RNASeq/fastqc -o /work_beegfs/sunam230/RNASeq/fastqc
```
In multiqc_report.html, you can see the quality of the data. 

The quality of the data is good so no trimming is needed.

### 2. Assembly
Assemble the reads with Megahit
```
# megahit
for i in *.fastq; do megahit -1 $i -o /work_beegfs/sunam230/RNASeq/megahit; done
```

### 3. Binning
Bin the contigs with MetaBAT2 / Concoct
```
# metabat2
for i in *.fastq; do metabat2 -i /work_beegfs/sunam230/RNASeq/megahit/final.contigs.fa -o /work_beegfs/sunam230/RNASeq/metabat2; done

# concoct
for i in *.fastq; do concoct -i /work_beegfs/sunam230/RNASeq/megahit/final.contigs.fa -o /work_beegfs/sunam230/RNASeq/concoct; done
```

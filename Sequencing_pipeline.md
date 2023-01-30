# Sequencing Pipeline

To go from raw data produced by a sequencer to a completed genome many steps are needed. These steps can be summarized under the term "sequencing pipeline" and are described below. In each step, the data is processed and the output is used as input for the next step. 
By utilizing batch scripts to run the pipeline on a cluster, it is possible to run commands on multiple samples at the same time. In addition, the resources provided by the cluster decrease the time it takes to run the scripts significantly.

## Cluster
The cluster is a high performance computer linked to the internet, it is used to run computationally intensive programs. To use the cluster, you need to connect to it using a terminal. Then you can run commands on the cluster, for example Bash scripts. The commands are sent to the cluster and the cluster runs the commands. The results are then sent back to your computer. 
Important commands:
- `ssh -X username@clustername` - Connect to the cluster
- `sbatch batch_name` - Run a Batch script on the cluster
- `squeue -u username` - Check the status of the jobs on the cluster
- `scancel job_id` - Cancel a job on the cluster
- `sinfo` - Check the status of the cluster
- `exit` - Disconnect from the cluster

## Batch scripts
Batch scripts are Bash scripts that are run on the cluster. The scripts are used to run commands on multiple samples at the same time. The Format is `script_name.sh`. At the beginning of the script, you need to specify the resources you need to run the script, as well as the output name. 
An example of a batch script is shown below. 

```
#!/bin/bash
#SBATCH -J job_name
#SBATCH -o job_name.out
#SBATCH -e job_name.err
#SBATCH -p short
#SBATCH -n 1
#SBATCH -t 0-00:30
#SBATCH --mem=100
#SBATCH --nodelist=node002

´whatever commands you want to run´
```
These lines specify:
- the name of the job
- the name of output and error files
- the partition
- the number of cores
- the time limit 
- the memory limit
- the node to run the job on

The partition is the queue on the cluster. The time limit is the maximum time the job can run. The memory limit is the maximum amount of memory the job can use.

To run the script, you need to use the command `sbatch script_name.sh`. The script will then be run on the cluster. The output and error files will be created in the directory where the script is located. The output file contains the output from the script. The error file contains the error messages from the script.

There are several batch file extensions for different programming languages:
- `.sh` - shell script
- `.py` - python script
- `.R` - R script


## Conda environment
The sequencing pipeline uses many programs and packages. To make sure that these programs are installed correctly, it is recommended to use a conda environment. A conda environment is a virtual environment that contains all the programs and packages needed to run the pipeline. 
- To create a conda environment, you need to use the command `conda create -n environment_name`. 
- To activate the environment, you need to use the command `conda activate environment_name`. 
- To install a program in the environment, you need to use the command `conda install program_name`. 
- To deactivate the environment, you need to use the command `conda deactivate`.

It might be necessary to install additional modules to run the programs. For example, to run fastqc, you need to install the module **fastqc**. To install a module, you need to use the command `module load module_name`.

To adjust the parameters of the programs correctly, it is recommended to read the documentation of the programs. The documentation can be found on the internet or by using the command `program_name --help`.

Look for the following information:
- input file
- output file
- essential parameters
- optional parameters

## Sequencing pipeline
### Overview of the sequencing pipeline
1. Raw data
2. Quality control / Trimming
3. Assembly
4. Binning
5. Quality assessment
6. Taxonomic classification



## 1. Raw data
- Raw data is the output from the sequencer.
- File format **FASTQ** (example file: SRR2584869_1.fastq.gz)
- The file contains four lines for each DNA fragment:
  -  The first line contains the fragment ID. (optional information like length)
  -  The second line contains the DNA sequence. 
  -  A separator, which is simply a plus (+) sign. (optional fragment ID) 
  -  The fourth line contains the quality score for each nucleotide in the DNA sequence. 
  
  The quality score is a number between 0 and 40 encoded in ASCII format. The higher the number, the higher the quality of the nucleotide. The quality score is calculated by the sequencer, it is used to filter out low quality nucleotides. The quality score is 
  
  An example of a FASTQ file is shown below. 
  ```
  @SEQ_ID
  GATTTGGGGTTCAAAGCAGTATCGATCAAATAGTAAATCCATTTGTTCAACTCACAGTTT
  +
  !''*((((***+))%%%++)(%%%%).1***-+*''))**55CCF>>>>>>CCCCCCC65
  ```


## 2. Quality control / Trimming
- The quality of the DNA fragments is checked.
- The DNA fragments are trimmed to remove low quality nucleotides.
- The DNA fragments are filtered to remove fragments with too many low quality nucleotides.

The following programs are used:

- **Fastqc** is a program that checks the quality of the DNA fragments. It creates a report that contains information about the quality of the DNA fragments. The report is used to decide which parameters to use for trimming and filtering.

  - Command: **[fastqc](https://home.cc.umanitoba.ca/~psgendb/doc/fastqc.help)**
  - Input file: `fastq` 
  - Output: report.`HTML`

  <details>
  <summary>Expand to see the documentation of fastqc</summary>

  fastqc accepts the following parameters:
    - `-o` - output directory
    - `-t` - number of threads
    - `-f` - file format
    - `-k` - kmer size
    - `-q` - quiet mode
    - `-c` - number of files to process in parallel
    - `-noextract` - do not extract the compressed file
    - `-nogroup` - do not create a summary report
    - `-nozip` - do not zip the output file
    - `-threads` - number of threads to use
    - `-format` - file format
    - `-kmers` - kmer size
    - `-quiet` - quiet mode
    - `-contaminants` - contaminants file
    - `-adapters` - adapters file
    - `-extract` - extract the compressed file
    - `-n` - number of files to process in parallel
    - `-s` - summary report
    - `-z` - zip the output file
    - `-h` - help
    - `-v` - version

  [Full documentation](https://home.cc.umanitoba.ca/~psgendb/doc/fastqc.help)

  example: 
  ```
  #essential (input file is in the current directory):
  fastqc input_file

  #optional:
  fastqc PATH/TO/input_file -o PATH/TO/output_directory -t 4 -f fastq -k 7 -q -c 4 -threads 4 -kmers 7 -n 4  
  ```
  </details>

  [Batch script used in course](https://github.com/YanGiencke/biol217/blob/main/scripts/assemblyscript.sh)


- **Fastp** is a program that trims and filters the DNA fragments. It can be used to trim the DNA fragments to a specific length, to remove low quality nucleotides from the beginning and end of the DNA fragments, and to remove DNA fragments with too many low quality nucleotides. The parameters for trimming and filtering are specified in the batch script. The output of fastp is a fastq file with the trimmed and filtered DNA fragments.

  - Command: **[fastp](https://github.com/OpenGene/fastp#fastp)**
  - Input file: `fastq` (+ information from report.`HTML`)
  - Output file: `fastq`

  [Batch script used in course](https://github.com/YanGiencke/biol217/blob/main/scripts/fastpscript.sh)


## 3. Assembly
- The DNA fragments are assembled into contigs.
- Quality assessment of the contigs.
  - Visualization of the contigs.
  - Analysis of metadata.

To assemble the DNA fragments into contigs, the program **[megahit](https://github.com/voutcn/megahit)** is used.
- Command: **[megahit](https://github.com/voutcn/megahit)**
- Input: `R1_fastq` + `R2_fastq` (trimmed and filtered by fastp)
- Output: `fa` (fasta)

  [Batch script used in course](https://github.com/YanGiencke/biol217/blob/main/scripts/assemblyscript.sh)


To visualize the contigs, you can use the program **[Bandage](https://rrwick.github.io/Bandage/)**. For this you need to convert the fasta file to a fastg file.

- Command: **[megahit_toolkit contig2fastg](https://github.com/voutcn/megahit)**
- Input: `fa` (fasta)
- Output: `fastg`

  example:
  ``` 
  megahit_toolkit contig2fastg 99 -i input_file.fa -o output_file.fastg
  ```
    [Batch script used in course](https://github.com/YanGiencke/biol217/blob/main/scripts/contig2fastg.sh)

  The following image shows the visualisation of the contigs using Bandage. The contigs are sorted by length.
  ![Bandage results](resources/bandage_graph.png)

A quick way to count the number of contigs in a fasta file is to use the following code:
  ```
  grep -c ">" final.contigs.fa
  ```
Qualty assessment of the contigs is done using **[quast](https://quast.sourceforge.net/quast.html)**. It creates a report that contains information about the contigs. The report is used to decide which parameters to use for binning or reassembly.

  - Command: **[quast](https://quast.sourceforge.net/quast.html)**
  - input: `fa` (fasta)
  - output: `HTML` (report)

    [Batch script used in course](https://github.com/YanGiencke/biol217/blob/main/scripts/metaquastscript.sh)

## 4. Binning
The binning is done in the following steps:
  - Mapping of the contigs as preparation for binning.
  - Binning
    - Refference based
    - De-Novo by differential coverage
  - Bin refinement
  - Bin reassembly

Binning is done in the [anvi'o](https://anvio.org/) environment, which requires a specific file format. To convert the fasta file to the anvi'o file type, the following command is used:

  - Command: **[anvi-script-reformat-fasta](https://anvio.org/help/main/programs/anvi-script-reformat-fasta/)**
  - Input: `fa` (fasta)
  - Output: `fa` (fasta anvi'o)

    [Batch script used in course](https://github.com/YanGiencke/biol217/blob/main/scripts/anvio_reformat.sh)


Mapping of the contigs is done using **[bowtie2]( http://bowtie-bio.sourceforge.net/bowtie2/index.shtml)**. Here the raw reads are mapped onto our assembled contigs.
  First the index of the contigs is created:

  - Command: **[bowtie2-build]( http://bowtie-bio.sourceforge.net/bowtie2/index.shtml)**
  - Input: `fa` (fasta anvi'o)
  - Output: `bt2` (bowtie2 index)

    [Batch script used in course](https://github.com/YanGiencke/biol217/blob/main/scripts/bowtie2_build.sh)


  Then the raw reads are mapped onto the contigs:
  - Command: **[bowtie2]( http://bowtie-bio.sourceforge.net/bowtie2/index.shtml)**
  - Input: `bt2` (bowtie2 index) + `fq` (fastq trimmed)
  - Output: `sam` (sequence alignment map)

      [Batch script used in course](https://github.com/YanGiencke/biol217/blob/main/scripts/mappingscript.sh)

  The mapping results are converted to a binary alignment map (bam) file:
  - Command: **[samtools view]( http://www.htslib.org/)**
  - Input: `sam` (sequence alignment map)
  - Output: `bam` (binary alignment map)

    [Batch script used in course](https://github.com/YanGiencke/biol217/blob/main/scripts/sam2bam.sh)

  The bam file is sorted and indexed:
  - Command: **[anvi-init-bam]( https://anvio.org/help/main/programs/anvi-init-bam/)**
  - Input: `bam` (binary alignment map)
  - Output: `bam` (sorted) + `bam.bai` (index)

    [Batch script used in course](https://github.com/YanGiencke/biol217/blob/main/scripts/sort_index_bam.sh)

Next we create a contigs database which holds important information about the contigs. The program **[anvi-gen-contigs-database](https://merenlab.org/2016/06/22/anvio-tutorial-v2/#creating-an-anvio-contigs-database)** computes the k-mer frequencies and identifies open reading frames (ORFs) using [Prodigal](https://github.com/hyattpd/Prodigal). On the created contigs database, we perform a search for hidden Markov models (HMMs) using [anvi-run-hmms](https://anvio.org/help/7/programs/anvi-run-hmms/).

 This is done using the following command:
  - Command: **[anvi-gen-contigs-database](https://merenlab.org/2016/06/22/anvio-tutorial-v2/#creating-an-anvio-contigs-database)** + **[anvi-run-hmms](https://anvio.org/help/7/programs/anvi-run-hmms/)**
  - Input: `fa` (fasta anvi'o)
  - Output: `db` (contigs database) 

    [Batch script used in course](https://github.com/YanGiencke/biol217/blob/main/scripts/contigdbscript.sh)

Creating an anvi'o profile:
  - Command: **[anvi-profile](https://merenlab.org/2016/06/22/anvio-tutorial-v2/#creating-an-anvio-profile)**
  - Input: `bam` (sorted) + `db` (contigs database)
  - Output: `db` (anvi'o profile)

    [Batch script used in course](https://github.com/YanGiencke/biol217/blob/main/scripts/anvio_profile.sh)

Merging the anvi'o profiles:
  - Command: **[anvi-merge](https://merenlab.org/2016/06/22/anvio-tutorial-v2/#merging-anvio-profiles)**
  - Input: `db` (anvi'o profiles)
  - Output: `db` (merged profile)

    [Batch script used in course](https://github.com/YanGiencke/biol217/blob/main/scripts/anvi_merge.sh)


Now the actual binning is done using [Metabat2](https://bitbucket.org/berkeleylab/metabat/src/master/ ) and [CONCOCT](https://github.com/BinPro/CONCOCT ), afterwards we choose the best bins by running the [DAS_Tool](https://github.com/cmks/DAS_Tool ).

Metabat2:
  - Command: **[anvi-gen-bins](https://merenlab.org/2016/06/22/anvio-tutorial-v2/#binning-with-anvio)**
  - Input: `db` (merged profile)
  - Output: `fa` (fasta) + `db` (bins database)

    [Batch script used in course](

Comand to adress files in multiple subdirectories: `find . -name "*.db" -print0 | xargs -0 -I {} anvi-merge {} -o merged.db`



Bin refinement is done using **[checkm](

Bin reassembly is done using **[concoct]( https://concoct.readthedocs.io/en/latest/)



## 5. Quality assessment
- The quality of the bins is assessed.
- The bins are sorted by quality.
types of contamination:
  - redundant sequences (parts are covered multiple times)
  - chimeric sequences (contamination by other organisms)
  - both redundant and chimeric sequences


Redundant sequences are detected using **[dRep](

Chimeric sequences are detected using **[chimera-slayer](

Reference representation score (RRS) is calculated using **[checkm](

Clade seperation score (CSS) is calculated using **[checkm](

## 6. Taxonomic classification
- The bins are classified into taxonomic groups.
- The bins are sorted by taxonomic group.



# Course summary

## Different types of sequencing

Samples:
    - Microbial community
    - Pure culture

Input:
    - DNA
    - RNA
    - Protein

Sequencing types:
    -Marker gene sequencing (Amplicon sequencing)
    -Whole genome sequencing (WGS)
    -Whole metagenome sequencing (WMGS)
    -Single cell sequencing (SCS)
    -Whole transcriptome sequencing (RNA-Seq)
    -Ribosome profiling (Ribo-Seq)
    -Whole proteome sequencing (WPS)

Analysis:
    - Taxonomic analysis
    - Functional analysis
    - MAG reconstruction
    - Metabolic analysis / differential gene expression

Sequencing technologies:
    - Sanger sequencing
    - 454 pyrosequencing
    - Illumina sequencing
    - PacBio sequencing
    - Nanopore sequencing
    - 2 generation sequencing
      - Illumina (MiSeq, iSeq, NextSeq, NovaSeq) (short read, high accuracy) (sequencing by synthesis)
      - Nanopore (MinION, GrigION, PromethION) (long read, low accuracy) (sequencing by current detection)
    - 3 generation sequencing
      - PacBio (Sequel, HiFi) (long read, high accuracy) (sequencing by binding)

Short vs long reads:
    - Short reads
      - shotgun sequencing 
      - primer-based sequencing
      - many samples
      - parallel sequencing
      - DNA quality not so important

    - Long reads
      - no bios from primers
      - good for assembly
      - so far less accurate

DNA extraction:
    - Problems
      - Different properties for different organisms
      - Polysaccharides
      - High salt
      - Host DNA
      - Cell wall composition
      - Lipids
      - Aggregation
      - Acids
    - Cracking of cells
      - Mechanical disruption (beating, grinding, sonication)
      - Chemical disruption (lysis, detergents, acids)
      - Enzymatic disruption (proteases, nucleases)

Problems in the sequencing line and how to solve them:
    - Sample preparation
      - multiple extraction methods
    - Sample preservation
      - Little storage time
      - Flash freezing
      - Alcohols
      - Glycerol
      - RNA Protection Reagents
    - Contamination
      - clean work
      - controls
    - Pros and cons of different sequencing technologies
      - Combining technologies
    - Bias in bioinformatics
      - use automated tools

RNA sequencing:
    - Ribosomal RNA is very abundant and must be removed
      - mRNA amplification
      - rRNA depletion

Allways whatch out for NUCLEASES!



## Experimental design
What must be considered when designing an experiment?
    - Sample size
    - Replicates 
    - Dimensions
    - Time
    - Money 
> Form a clear hypothesis and design your experiment accordingly. What is realy neccessary to answer your question? Until what point is it worthwile to invest more?

Wetlab experiments:
    - Sample preparation
    - Sequencing

Bioinformatics:
    - Assembly pipeline
    - Interpretation of results
    - Time
    - What is the question?
    - What is the data?
    - What is the analysis?
    - What is the result?
    - What is the conclusion?

Exaple: Deeper sequencing or more replicates?
    - More replicates is usually more cost effective
    - Optimal cost-reward ratio (RNA-Seq)
      - optimal read length: 50 bp single end, 100 bp paired end
      - optimal replicate number: 3-5 (depending on diversity)
 
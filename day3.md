# Genaral sequencing
## Binning
- Clustering contigs
- Two methods:
  -   Refference based
  -   De-Novo
- x

## Basics:
- Gouping by
  -   GC-Content
  -   Tetramer or K-mer frequencies
  -   x


## Analyzing frequency of K-mers
- look at frame of length K 
- count frequency of sequence in frame in DNA
- move frame one nucleotide ...
- capture date in table/matix
- transfer data to graphs

## Analyzing K-mer graphs
- small areas = Ribosomal genes (very conserved genes)
- biger areas = Geneic islands or virus induced DNA

## Analysing coverage
- looking at contigs and their coverage in different probes
  -   simillar changes in coverage suggest two contigs are frome one genome
- looking at a refference genome
  -   allows an estimation abundance

## MAGs quality assessment
- fragmentation

# Programming stuff

## looking at sequences:
- ´cat file.txt' to look at whole file
- ´head file.txt' to look at first 10 lines
- ´tail file.txt' to look at last 10 lines
- ´less file.txt' to look at file in less
- ´grep "string" file.txt' to look for string in file
- ´grep -v "string" file.txt' to look for string not in file
- ´grep -c "string" file.txt' to count number of times string appears in file

# Questions

- Please submit your generated figure and explain in your own words what you can see:
The graph below shows the Bandage results ![Bandage results](resources/bandage_graph.png)
The graph shows the different contigs from the assembly, sorted by length. You can also identifiy loops in the graph.

- What is your N50 value? Why is this value relevant?
The N50 value is 2961. This value shows the length of the contigs that are needed to cover half of the total length of the contigs.

- How many contigs are assembled?
56057

- What is the total length of the contigs?
142162752

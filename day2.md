Murat
#Shotgun sequencing 
First live categorised via morphology 
Then first microorganisms are found
differentiated by 16S sequencing (bacteria, archaea)
Primers for different 16S regions
Primers target conserved regions and amplify the hypervariable regions inbetween two conserved regions
    problem if the microbe does not have the conserved region the primer wont bind
Amplicon sequencing - old
Shotgun sequencing

Mircobes in gut dont influence the hosts heatlth in specific cases like IBS - it is not possible to heal IBS by introducing different microbiota

# Genome binning
Genomes - Shotgun sequencing- Short reads - De-Novo assembly - Contigs - metagenomic binning - MAGs
    problems microbes have different abundances - low abundance makes reassebly impossible - High abundance often comes with high diversity which interfers with reassembly

# Sequence composition
Genomes have a destinctive composition of nucleotides
The frequency of each dinucleotide (2-mer) (AA,AC,AG,GA,CA,CC,CG,GC,AT,TA) in a gene is equal to its abundance in the whole genome
by analysing genomes like this the data can be written in a table of equal lenth for all, no matter the length of the genome

# K-mer frequencies
important for sequence composition 
K is the number that describes the length of the sequence
increasing the K over 4 results in matrices with many 0 as the specific nucleotide 4-mers might not be present in the genome

# Differential coverage
How well is a specific genome covered in a sample
    i.e. a point in the genome (contig) might be covered by 7 different reads
    in a differnt sample this contig might be covered differently
When looking at different samples a simillar change in coverage suggests that these belong to the same genome
once a genome is assembled you can use coverage as an estimation of species abundance

# How to tell if a Genome is complete?
Comparing with closely related taxa
functional annotations
    look at genes that appear in single copy numer in close taxa 
    identify if all these genes are present in the assembled genome
        if many are missing the genome is not jet completed
        if they are doubled the genome might contain equal parts twice (contigs are inserted more than once)


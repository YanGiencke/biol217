# Questions
Do you get Archaea bins that are chimeric?
hint: look at the CSS score (explained in the lecture) and the column PASS GUNC in the tables outputs per bin in your gunc_output folder.
Yes, we chimeric bins from the concoct binning.
The CSS score describes


In your own words (2 sentences max), explain what is a chimeric bin.
A chimeric bin is a bin that includes sequences from multiple organisms of different species. 


Questions to the bin refinement:

    Does the quality of your Archaea improve?
      Completeness before: 97,4% 
      Completeness after: 93,4%
      The redundancy stays the same: 5,3%
      Although the completeness decreased,  the bin is improved because we removed potential chimeric sequences.
    
    Submit your output Figure
![Refined bin](/resources/bin_refine_cut.png)


how abundant are the archaea bins in the 3 samples? (relative abundance)
**you can also use anvi-inspect -p -c, anvi-script-get-coverage-from-bam or, anvi-profile-blitz. Please look up the help page for each of those commands and construct the appropriate command line
    BGR_130708: 0.58
    BGR_130527: 1.14
    BGR_130305: 1.76


Did you get a species assignment to the Archaea bins previously identified?
    Metabat2: Methanoculleus sp012797575
    CONCOCT: Methanosarcina flavescens

Does the HIGH-QUALITY assignment of the bin need revision?
    Yes, a manual quality check is helpful.

hint: MIMAG quality tiers https://www.nature.com/articles/nbt.3893


How many species do you have in the dataset?

Try to dereplicate again at 90% identity then at 80%identity. In you own words, explain the differences between the different %identities.


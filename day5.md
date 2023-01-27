# Questions
Do you get bins that are chimeric?
hint: look at the CSS score (explained in the lecture) and the column PASS GUNC in the tables outputs per bin in your gunc_output folder.


In your own words (2 sentences max), explain what is a chimeric bin.
A chimeric bin is a bin that includes sequences from multiple organisms of different species. 



# Code
```

conda activate /home/sunam225/miniconda3/miniconda4.9.2/usr/etc/profile.d/conda.sh/envs/anvio-7.1

cd /work_beegfs/sunam230/Day5/5_anvio_profiles/SUMMARY_FINAL/bin_by_bin/

mkdir ../../ARCHAEA_BIN_REFINEMENT

cp Bin_METABAT__25/*.fa ../../ARCHAEA_BIN_REFINEMENT
cp Bin_Bin_1_sub/*.fa ../../ARCHAEA_BIN_REFINEMENT

conda activate /home/sunam226/.conda/envs/gunc

cd ../../ARCHAEA_BIN_REFINEMENT

mkdir GUNC

for i in *.fa; 
    do gunc run -i "$i" -r /home/sunam226/Databases/gunc_db_progenomes2.1.dmnd --out_dir GUNC --threads 10 --detailed_output; 
done
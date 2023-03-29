#Final project

#Sakshi Goyal and Liam Brockley

#Replicating Sanghi et al: https://www.ncbi.nlm.nih.gov/pmc/articles/PMC8484618/
#Files stored at GEO database: https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE162515

#Part I: ATAC-seq data

# Part i: ATAC-Seq data analysis (Pre-processing, peak calling, normalization...)

# While there are 106 ATAC-seq samples for this project, we will only use the first 3.
# These have 2 technical replicates each, and we randomly chose which replicate to use:

# ATAC_Seq_F001_C1_T1_Rep1 
# ATAC_Seq_F002_C1_N1_Rep1
# ATAC_Seq_F003_C1_M1_Rep2

# In the original paper, the replicates were all processed and then merged at the end.
# Since our goal was not to accomplish all pre-processing steps, but only to demonstrate the process, we only processed 1 replicate of each sample.
# This group processed the fastqs using the ENCODE pipeline. The diagram of this pipeline is shown below:
![Image name](path to image)

# Since this pipeline mainly uses programs we have covered in class, I called them one at a time instead of using the pipeline

#Pre-processing steps:

# Trim adapters with trimmomatic (This study used cutadapt but they accomplish the same thing)

# QC: Check the fastq files using fastQC

mkdir fastQC_output  
fastqc -o ./fastQC_output *.fastq.gz

#Download fastqc files to computer for analysis. Give summary of analysis:...

# Align to hg38 with bowtie2, generating SAM file

# Convert to BAM file using samtools

# Sort the alignment files by genomic position: sambamba

# Filter for uniquely mapped reads: sambamba 

#ATAC-seq processing steps:

# Peak calling with macs2 [see assn 5] using the special parameters outlined in the paper

mkdir peak_calling
macs2 callpeak -t [tfile] -c [cfile] -f BAM --outdir peak_calling -n [output name]

#extra Parameters given in the paper:
–shift−75–extsize 150–nomodel–call-summits–nolambda–keep-dup all -p 0.01
#"The peak summits were then extended by 100 bp on either side to a final width of 200 bp.

# Use BEDTools coverage to count independent TN5 insertions in each peak

# Use edgeR to calculate cpm (matrix, log = TRUE, prior.count = 5) 

# Use preprocessCore’s normalize.quantiles in R to perform quantile normalization 


#Part ii: Analysis of peak counts

#Read in the count data for the ATAC-seq part of the experiment
atacSeqData = read.table("GSE162515_ATACseq_logCounts.txt", stringsAsFactors = FALSE, header = TRUE)

# Correlation of counts across the 
#https://github.com/asanghi7/epigenoproteomics/blob/main/R/graphcorrelation.R

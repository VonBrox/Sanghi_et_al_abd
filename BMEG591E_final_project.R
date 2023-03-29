#Final project

#Sakshi Goyal and Liam Brockley

#Replicating Sanghi et al: https://www.ncbi.nlm.nih.gov/pmc/articles/PMC8484618/
#Files stored at GEO database: https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE162515

#Part I: ATAC-seq data

# Part i: Pre-processing

# While there are 106 ATAC-seq samples for this project, we will only use the first 3
# Of these, which have 2 technical replicates each, we randomly chose which replicate to use:

# ATAC_Seq_F001_C1_T1_Rep1 
# ATAC_Seq_F002_C1_N1_Rep1
# ATAC_Seq_F003_C1_M1_Rep2

# In the original paper, the replicates were all processed and then merged at the end.
# Since our goal was not to accomplish all pre-processing steps, but only to demonstrate we only processed 1 replicate of each.
# The group processed the fastqs using the ENCODE pipeline, pipeline diagram shown below:
![Image name](path to image)

# Since this pipeline mainly uses programs we have covered in class, I called them one at a time instead of using the pipeline

#Pre-processing steps:

# Trim adapters with cutadapt (ENCODE pipeline uses cutadapt, not trimmomatic)



# QC: Check the fastq files using fastQC

mkdir fastQC_output  
fastqc -o ./fastQC_output *.fastq.gz

#Download fastqc files to computer for analysis







# Align to hg38 with bowtie2, generating SAM file
  
# Convert to BAM file using samtools
  
# Sort the alignment files by genomic position: sambamba (*https://lomereiter.github.io/sambamba/docs/sambamba-view.html*)
  
# Filter for uniquely mapped reads: sambamba 
    

#ATAC-seq processing steps:
# Peak calling with macs2 [see assn 5] using the special parameters outlined in the paper

mkdir peak_calling
macs2 callpeak -t [tfile] -c [cfile] -f BAM --outdir peak_calling -n [output name]

#extra Parameters given in the paper:
–shift−75–extsize 150–nomodel–call-summits–nolambda–keep-dup all -p 0.01


#Read in the count data for the ATAC-seq part of the experiment
atacSeqData = read.table("GSE162515_ATACseq_logCounts.txt", stringsAsFactors = FALSE, header = TRUE)
atacSeqData = read.table(textConnection(readLines(gzcon(url("ftp://ftp.ncbi.nlm.nih.gov/geo/series/GSE148nnn/GSE148175/suppl/GSE148175_count_matrix_raw_atac_BRM014_ACBI1.csv.gz")))), 
                         sep=",", stringsAsFactors = FALSE, header = TRUE)
####Step1-Preprocessing####

##FASTQC##

mkdir -p Raw_Data/fastqc_report 
fastqc Raw_Data/*.fastq.gz -o Raw_Data/fastqc_report

multiqc Raw_Data/fastqc_report -o Raw_Data/multiqc

##FASTP##
mkdir -p fastp_out

fastp -i Raw_Data/SRR14995014_1.fastq -I Raw_Data/SRR14995014_2.fastq -o fastp_out/SRR14995014_1.fastq -O fastp_out/SRR14995014_2.fastq

fastp -i Raw_Data/SRR14995015_1.fastq -I Raw_Data/SRR14995015_2.fastq -o fastp_out/SRR14995015_1.fastq -O fastp_out/SRR14995015_2.fastq

fastp -i Raw_Data/SRR14995016_1.fastq -I Raw_Data/SRR14995016_2.fastq -o fastp_out/SRR14995016_1.fastq -O fastp_out/SRR14995016_2.fastq

fastp -i Raw_Data/SRR14995017_1.fastq -I Raw_Data/SRR14995017_2.fastq -o fastp_out/SRR14995017_1.fastq -O fastp_out/SRR14995017_2.fastq

fastp -i Raw_Data/SRR14995018_1.fastq -I Raw_Data/SRR14995018_2.fastq -o fastp_out/SRR14995018_1.fastq -O fastp_out/SRR14995018_2.fastq

fastp -i Raw_Data/SRR14995019_1.fastq -I Raw_Data/SRR14995019_2.fastq -o fastp_out/SRR14995019_1.fastq -O fastp_out/SRR14995019_2.fastq

##FASTQC##
mkdir -p fastp_out/fastqc_report
fastqc fastp_out/*.fastq -o fastp_out/fastqc_report/

multiqc fastp_out/fastqc_report/ -o fastp_out/multiqc

####Step2-Alignment####

##GENOME INDEXING##
hisat2-build Reference/reference.fa Reference/reference.fa

##ALIGNMENT##
mkdir -p Alignments

hisat2 -x Reference/reference.fa -1 fastp_out/SRR14995014_1.fastq -2 fastp_out/SRR14995014_2.fastq --dta-cufflinks -S Alignments/SRR14995014.sam

hisat2 -x Reference/reference.fa -1 fastp_out/SRR14995015_1.fastq -2 fastp_out/SRR14995015_2.fastq --dta-cufflinks -S Alignments/SRR14995015.sam

hisat2 -x Reference/reference.fa -1 fastp_out/SRR14995016_1.fastq -2 fastp_out/SRR14995016_2.fastq --dta-cufflinks -S Alignments/SRR14995016.sam

hisat2 -x Reference/reference.fa -1 fastp_out/SRR14995017_1.fastq -2 fastp_out/SRR14995017_2.fastq --dta-cufflinks -S Alignments/SRR14995017.sam

hisat2 -x Reference/reference.fa -1 fastp_out/SRR14995018_1.fastq -2 fastp_out/SRR14995018_2.fastq --dta-cufflinks -S Alignments/SRR14995018.sam

hisat2 -x Reference/reference.fa -1 fastp_out/SRR14995019_1.fastq -2 fastp_out/SRR14995019_2.fastq --dta-cufflinks -S Alignments/SRR14995019.sam

##SAMtoBAM and SORT BAM##
samtools view -b Alignments/SRR14995014.sam | samtools sort -o Alignments/SRR14995014.bam
samtools view -b Alignments/SRR14995015.sam | samtools sort -o Alignments/SRR14995015.bam
samtools view -b Alignments/SRR14995016.sam | samtools sort -o Alignments/SRR14995016.bam
samtools view -b Alignments/SRR14995017.sam | samtools sort -o Alignments/SRR14995017.bam
samtools view -b Alignments/SRR14995018.sam | samtools sort -o Alignments/SRR14995018.bam
samtools view -b Alignments/SRR14995019.sam | samtools sort -o Alignments/SRR14995019.bam

##cuffdidd output report
cuffdiff --no-update-check GTF/genetranscript.gtf Alignments/SRR14995014.bam,Alignments/SRR14995015.bam,Alignments/SRR14995016.bam Alignments/SRR14995017.bam,Alignments/SRR14995018.bam,Alignments/SRR14995019.bam  -o cuffdiff_output

#linux codes
#txt to tsv conversion
awk '{gsub(/\t+/, "\t"); print}' david_clust.txt > david_clust.tsv

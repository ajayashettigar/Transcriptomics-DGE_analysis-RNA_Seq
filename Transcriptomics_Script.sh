####Step1-Preprocessing####

##FASTQC##

mkdir -p Raw_Data/fastqc_report 
fastqc Raw_Data/*.fastq.gz -o Raw_Data/fastqc_report

multiqc Raw_Data/fastqc_report -o Raw_Data/multiqc

##FASTP##
mkdir -p fastp_out

# Define an array of file prefixes i.e SRR IDs of your data
declare -a FILES=("SRR14995014" "SRR14995015" "SRR14995016" "SRR14995017" "SRR14995018" "SRR14995019")

# Iterate over each file prefix and run fastp
for ((i=0; i<${#FILES[@]}; i++)); do
    file=${FILES[$i]}
    fastp -i Raw_Data/${file}_1.fastq -I Raw_Data/${file}_2.fastq -o fastp_out/${file}_1.fastq -O fastp_out/${file}_2.fastq
done

##FASTQC##
mkdir -p fastp_out/fastqc_report
fastqc fastp_out/*.fastq -o fastp_out/fastqc_report/

multiqc fastp_out/fastqc_report/ -o fastp_out/multiqc

####Step2-Alignment####

##GENOME INDEXING##
hisat2-build Reference/reference.fa Reference/reference.fa

##ALIGNMENT##
mkdir -p Alignments

# Iterate over a sequence of numbers and generate file names
for i in {14..19}
do
    file="SRR149950${i}"
    hisat2 -x Reference/reference.fa -1 fastp_out/${file}_1.fastq -2 fastp_out/${file}_2.fastq --dta-cufflinks -S Alignments/${file}.sam
done

##SAMtoBAM and SORT BAM##
# Iterate over a sequence of numbers and generate file names
for i in {14..19}; do
    file=$(printf "SRR149950%02d" $i)
    samtools view -b Alignments/${file}.sam | samtools sort -o Alignments/${file}.bam
done

##cuffdidd output report
cuffdiff --no-update-check GTF/genetranscript.gtf Alignments/SRR14995014.bam,Alignments/SRR14995015.bam,Alignments/SRR14995016.bam Alignments/SRR14995017.bam,Alignments/SRR14995018.bam,Alignments/SRR14995019.bam  -o cuffdiff_output

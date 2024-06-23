# Transcriptomics: DEGs Induced by Betel Nut Chewing and Their Links to Type 2 Diabetes & Obesity

## Project Overview

This project investigates the whole transcriptome changes induced by Betel nut (Areca catechu) in a human monocyte cell line, with a focus on identifying genes related to Type 2 Diabetes (T2D) and obesity. This study reproduces the findings from the original research paper titled "Areca catechu (Betel-nut)-induced whole transcriptome changes in a human monocyte cell line that may have relevance to diabetes and obesity; a pilot study" by Shirleny R. Cardosa et al.

## Table of Contents

- [Project Overview](#project-overview)
- [Data Sources](#data-sources)
- [Methodology](#methodology)
- [Results](#results)
- [Acknowledgements](#acknowledgements)
- [How to Use](#how-to-use)
- [Contact](#contact)

## Data Sources

All the raw data used in this experiment were downloaded from the [ENA Browser](https://www.ebi.ac.uk/ena/browser/home) using the SRR IDs provided in the SRA run selector, which can be found in the GEO data of this experiment. The datasets are accessible under the GEO accession number GSE179143. The gene transcript file for the Cuffdiff tool is the GTF file obtained from the [Ensembl](https://ftp.ensembl.org/pub/release-112/gtf/homo_sapiens/Homo_sapiens.GRCh38.112.gtf.gz) database.

## Methodology

### Data Collection and Pre-processing

- **Data Collection**: Raw sequencing data from six samples were collected: three treated with Arecoline (SRR14995014, SRR14995015, SRR14995016) and three treated with MNPA (SRR14995017, SRR14995018, SRR14995019).
- **Quality Control**: Adapter sequences were removed using Fastp v0.23.2, and the quality of the trimmed reads was assessed using FastQC v0.11.9 and aggregated with MultiQC v1.12.
- **Alignment**: Processed reads were aligned to the indexed human genome (GRCh38.p14) using Hisat2 v2.2.1 with the --dta-cufflinks option.

### Differential Gene Expression Analysis

- **Analysis Tools**: Differential gene expression analysis was performed using Cuffdiff v2.2.1. Significant genes were identified based on a p-value < 0.005.
- **Pathway Enrichment**: Enrichment analysis was conducted using DAVID and ShinyGO 0.8. Pathways with an enrichment score greater than 4 were selected for further interpretation.

## Results

### Key Findings

- **Significant Genes**: The Cuffdiff analysis identified 42 significant genes, with key genes including WDR73, GPATCH4, ATF6B, and others.
- **Pathway Enrichment**: Pathways related to endoplasmic reticulum membrane, thermogenesis, and thyroid hormone synthesis were significantly enriched.

## Acknowledgements

I would like to express my deepest gratitude to my advisor, Ms. Shilpa Rathode, for their unwavering support, guidance, and encouragement throughout the course of this research. I am immensely grateful to the Mediomix Diagnosis and Bioresearch Centre for providing me with the opportunity to conduct my research in their facility. Special thanks to my lab colleagues, friends, and family for their support. I also extend my gratitude to the NCBI-GEO database for providing the datasets used in this study.

## How to Use

1. **Download Data**: Access the raw sequencing data from the GEO database using accession number GSE179143.
2. **Pre-process Data**: Use Fastp, FastQC, and MultiQC to pre-process and assess the quality of the data.
3. **Align Reads**: Align the reads to the human genome (GRCh38.p14) using Hisat2.
4. **Analyze Data**: Perform differential gene expression analysis with Cuffdiff and conduct pathway enrichment analysis using DAVID and ShinyGO.

## Contact
I am glad to share this project and invite any discussions or suggestions for improvement.
For any questions or further information, you can reach me via [LinkedIn](www.linkedin.com/in/ajayashettigar/) or [Email](ajshettigar1253@gmail.com).

### Making a directories and running FastQC and MultiQC protocols.

mkdir qc_results
fastqc *.fastq -o qc_results

mkdir multiQC_report
multiqc qc_results -o multiQC_report


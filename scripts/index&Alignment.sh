### Indexing Reference Human Genome
bwa index GRCh38.fa

### Alignment and sorting bam file

bwa mem -t 8 GRCh38.fa R1.trimmed.fastq R2.trimmed.fastq > aln.bam
samtools view -S -b aln.sam > aln.bam
samtools sort -o aln_sorted.bam aln.bam

### Index Aligned bam
bwa index aln_sorted.bm


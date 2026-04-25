#### Variant calling using gatk

gatk AddOrReplaceReadGroups 
 -I aln_sorted.bam -O aln_sorted.rg.bam 
 -RGID SRR22164370 -RGLB lib1 -RGPL ILLUMINA 
 -RGPU unit1 -RGSM SRR22164370
 
### Analyzing marked duplicates
gatk MarkDuplicates 
 -I aln_sorted.rg.bam -O aln_sorted.markup.bam -M markup_metrics
### Creating a Sequence dictionary
gatk CreateSequenceDictionary -R GRCh38.fa -o GRCh38.fa.dict

### Indexing aln_sorted.markup.bam for compatability issues

samtools index aln_sorted.markup.bam

### Base-Quality Score
gatk BaseRecalibrator -I aln_sorted.markup.bam 
 -R GRCh38.fa --known-sites dbsnp.vcf.fa.gz
 -O recall_data.table
 
### Applying Base Quality Score
gatk ApplyBQSR -R GRCh38.fa -I aln_sorted.markup.bam 
 --bqsr-recal-file recal_data.table -O aln_sorted.markup.recal.bam

### Conducing Variant calling
 gatk HaplotypeCaller -R GRCh38.fa -I aln_sorted.markup.recal.bam -O raw.g.vcf.gz
 -ERC GVCF

### Only one sample file will be needed for futhur analysis, only 1 SRR accession code was used.

 ### Variant filtering for SNPS
 
 gatk VariantFiltration \
    -R GRCh38.fa \
    -V raw.vcf \
    -O SNP_filtered.vcf \
    --filter-name "QD_filter" --filter-expression "QD_filter < 2.0" \
    --filter-name "FS_filter" --filter-expression "FS_filter > 60.0" \
    --filter-name "MQ_filter" --filter-expression "MQ_filter < 40.0" \
    --filter-name "MQRankSum_filter" --filter-expression "MQRankSum_filter < -12.5" \
    --filter-name "ReadPosRankSum_filter" --filter-expression "ReadPosRankSum_filter < -8.0"

### Variant filtering for INDELs

 gatk VariantFiltration \
    -R GRCh38.fa \
    -V raw.vcf \
    -O INDEL_filtered.vcf \
    --filter-name "QD_filter" --filter-expression "QD < 2.00" \
    --filter-name "FS_filter" --filter-expression "FS > 200.00" \
    --filter-name "ReadPosRankSum" --filter-expression "ReadPosRankSum < -20.00" \

### Selecting SNP variants

gatk SelectVariants -R GRCh38.dna.toplevel.fa.gz -V SNP_filtered.vcf --exclude-filtered -O Final_SNPS.vcf

### Selecting INDELS variants

gatk SelectVariants -R GRCh38.dna.toplevel.fa.gz -V INDELs_filtered.vcf --exclude-filtered -O Final_INDELs.vcf

    

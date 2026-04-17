# Quality Control Report Summary (MultiQC)

This directory contains aggregated quality control results generated using MultiQC, summarizing FastQC outputs across all sequencing samples in the pharmacogenomics pipeline.

---

## 📊 Report Overview

- **Tool:** MultiQC (modular aggregation of bioinformatics QC reports)
- **Generated on:** 2025-10-12, 19:56 EEST  
- **Input directory:** `/home/mohamed/Desktop/project/qc_result`
- **Underlying QC tool:** FastQC v0.12.1  
- **Purpose:** Quality assessment of whole exome sequencing data (CYP450 pharmacogenetic study)

---

## 🧬 Study Context

This QC analysis is part of a pharmacogenetics workflow investigating:

- :contentReference[oaicite:0]{index=0} metabolism variability
- CYP450 gene region sequencing in Zimbabwean populations
- Downstream variant calling and clinical annotation

---

## 📈 General Statistics

| Sample Name         | Duplicates | GC Content | Median Length | Sequencing Depth |
|--------------------|------------|------------|---------------|------------------|
| R1                 | 15.9%      | 50.0%      | 136 bp        | 24.2M            |
| R2                 | 15.8%      | 50.0%      | 136 bp        | 24.2M            |
| SRR22164370_1      | 16.1%      | 50.0%      | 150 bp        | 24.2M            |
| SRR22164370_2      | 16.1%      | 50.0%      | 150 bp        | 24.2M            |

---

## 🔬 Key Quality Metrics Interpretation

### 1. Read Quality
- Per-base and per-sequence quality scores indicate overall sequencing quality distribution.
- No major degradation trends reported across read positions.

### 2. GC Content
- Average GC content: ~50%
- Suggests expected human exome composition consistency.

### 3. Sequence Duplication
- Duplication levels: ~15.8–16.1%
- Moderate duplication typical for exome sequencing due to PCR amplification.

### 4. Sequence Length Distribution
- Two read length groups observed:
  - 136 bp (R1/R2)
  - 150 bp (SRR22164370 runs)

### 5. Adapter Content
- No major adapter contamination detected (based on MultiQC status summaries)

### 6. Overrepresented Sequences
- <1% of reads affected across all samples
- No significant contamination signal detected

---

## 🧪 QC Status Summary

| Metric | Status |
|--------|--------|
| Base Quality | Normal |
| GC Distribution | Normal |
| Duplication | Slightly elevated (expected for WXS) |
| Adapter Contamination | Low |
| N Content | Normal |

---

## 🧬 Biological Relevance

These sequencing reads originate from a Whole Exome Sequencing (WXS) study targeting:

- CYP450 gene regions involved in drug metabolism
- Pharmacogenetic variability affecting :contentReference[oaicite:1]{index=1} response

---

## ⚙️ Software

- FastQC v0.12.1  
- MultiQC (aggregated QC reporting tool)

---

## 📌 Conclusion

Overall sequencing quality is suitable for downstream analysis, including:

- Read trimming
- Alignment to reference genome
- Variant calling (VCF generation)
- Clinical annotation (ClinVar and pharmacogenomic interpretation)

---

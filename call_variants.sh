#!/bin/bash

REF=Brapa_sequence_v1.5.fa
R09=/dsu0/ResearchData/Shimizu_de_novo/assemblies/resistant_raw_reads_to_Chiifu/R09_Chiifu.sorted.bam
S11=/dsu0/ResearchData/Shimizu_de_novo/assemblies/susceptible_raw_reads_to_Chiifu/S11_Chiifu.sorted.bam

# Example command:
# samtools mpileup -ugf <ref.fa> <sample1.bam> <sample2.bam> <sample3.bam> | bcftools call -vmO z -o <study.vcf.gz>
samtools mpileup -q 20 -Q 30 -ugf $REF $R09 | bcftools call -p 0.9 -v -c -O z -o R09-variants.vcf.gz
samtools mpileup -q 20 -Q 30 -ugf $REF $S11 | bcftools call -p 0.9 -v -c -O z -o S11-variants.vcf.gz

# To prepare our VCF for querying we next index it using tabix:
tabix -p vcf R09-variants.vcf.gz
tabix -p vcf S11-variants.vcf.gz

#!/bin/bash

bedtools intersect -wa -a Brapa_EcoRI_sites.tsv -b ../S11-homozygous-variants.snpeff.unique.vcf.gz > S11-homozygous-variants.snpeff.unique.EcoRI.tsv
bedtools intersect -wa -a Brapa_EcoRI_sites.tsv -b ../R09-homozygous-variants.snpeff.unique.vcf.gz > R09-homozygous-variants.snpeff.unique.EcoRI.tsv

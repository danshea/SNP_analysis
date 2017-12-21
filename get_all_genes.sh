#!/bin/bash

S11='S11-homozygous-variants.snpeff.unique.vcf.gz'
R09='R09-homozygous-variants.snpeff.unique.vcf.gz'

S11_ALL='S11-homozygous-variants.snpeff.unique.ALL.tsv'
R09_ALL='R09-homozygous-variants.snpeff.unique.ALL.tsv'
# grep out comments
zgrep -v -e '^#' $S11 > $S11_ALL
zgrep -v -e '^#' $R09 > $R09_ALL

# Grab the important fields for generating the gene list
S11tmp=$(mktemp)
R09tmp=$(mktemp)
cut -f1,2,4,5,8 $S11_ALL > $S11tmp
cut -f1,2,4,5,8 $R09_ALL > $R09tmp
mv $S11tmp $S11_ALL
mv $R09tmp $R09_ALL

echo "Process these output files using makeGeneLists.ipynb notebook"
echo "$S11_ALL"
echo "$R09_ALL"

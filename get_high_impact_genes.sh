#!/bin/bash

S11='S11-homozygous-variants.snpeff.unique.vcf.gz'
R09='R09-homozygous-variants.snpeff.unique.vcf.gz'

S11_HIGH='S11-homozygous-variants.snpeff.unique.HIGH.tsv'
R09_HIGH='R09-homozygous-variants.snpeff.unique.HIGH.tsv'
# grep out entries that are HIGH impact polymorphisms and put them into a new list.
zgrep 'HIGH' $S11 > $S11_HIGH
zgrep 'HIGH' $R09 > $R09_HIGH

# Grab the important fields for generating the gene list
S11tmp=$(mktemp)
R09tmp=$(mktemp)
cut -f1,2,4,5,8 $S11_HIGH > $S11tmp
cut -f1,2,4,5,8 $R09_HIGH > $R09tmp
mv $S11tmp $S11_HIGH
mv $R09tmp $R09_HIGH

echo "Process these output files using makeGeneLists.ipynb notebook"
echo "$S11_HIGH"
echo "$R09_HIGH"

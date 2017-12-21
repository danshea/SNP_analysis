#!/bin/bash
R09='R09-variants.vcf.gz'
S11='S11-variants.vcf.gz'

R09homo='R09-homozygous-variants.tsv'
S11homo='S11-homozygous-variants.tsv'

# Filter out heterozygous calls and output human readable tsv files
bcftools view $R09 | egrep '^A' | egrep  '	1/1:' >> $R09homo
bcftools view $S11 | egrep '^A' | egrep  '	1/1:' >> $S11homo

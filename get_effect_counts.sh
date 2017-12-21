#!/bin/bash

S11="S11-homozygous-variants.snpeff.vcf.gz"
R09="R09-homozygous-variants.snpeff.vcf.gz"
S11_unique="S11-homozygous-variants.snpeff.unique.vcf.gz"
R09_unique="R09-homozygous-variants.snpeff.unique.vcf.gz"

# Get counts for various features
for sample in $S11 $R09 $S11_unique $R09_unique; do
  echo "$sample"
  echo "Nonsyn $(zcat $sample | egrep -v '^#' | grep -c 'missense_variant')"
  echo "Syn $(zcat $sample | egrep -v '^#' | grep -c 'synonymous_variant')"
  echo "Nonsense $(zcat $sample | egrep -v '^#' | grep -c 'stop_gained')"
  echo "Stop Lost $(zcat $sample | egrep -v '^#' | grep -c 'stop_lost')"
  echo "Frameshift $(zcat $sample | egrep -v '^#' | grep -c 'frameshift_variant')"
  echo "Nonframeshift $(zcat $sample | egrep -v '^#' | grep 'INDEL' | grep -v 'frameshift_variant' | grep -v 'intron_variant' | grep -v 'intergenic' | grep -cv 'splice')"
  echo "Splice total $(zcat $sample | egrep -v '^#' | grep -c 'splice')"
  echo "Splice SNP $(zcat $sample | egrep -v '^#' | grep -v 'INDEL' | grep -c 'splice')"
  echo "Splice indel $(zcat $sample | egrep -v '^#' | grep 'INDEL' | grep -c 'splice')"
  echo "Other total $(zcat $sample | egrep -v '^#' | grep -v 'splice'| grep -c 'intron_variant')"
  echo "Other SNP $(zcat $sample | egrep -v '^#' | grep -v 'INDEL' | grep -v 'splice'| grep -c 'intron_variant')"
  echo "Other indel $(zcat $sample | egrep -v '^#' | grep 'INDEL' | grep -v 'splice'| grep -c 'intron_variant')"
  echo "Intergenic total $(zcat $sample | egrep -v '^#' | grep -c 'intergenic')"
  echo "Intergenic SNP $(zcat $sample | egrep -v '^#' | grep -v 'INDEL' | grep -c 'intergenic')"
  echo "Intergenic indel $(zcat $sample | egrep -v '^#' | grep 'INDEL' | grep -c 'intergenic')"
done

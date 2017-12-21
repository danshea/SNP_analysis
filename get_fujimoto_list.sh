#!/bin/bash

genes="Bra021218 Bra008136 Bra011622 Bra020757 Bra028623 Bra022067 Bra024218 Bra022531 Bra006644 Bra023830 Bra033444 Bra030241 Bra005057 Bra027316 Bra019817 Bra018755 Bra019665 Bra009972 Bra015923 Bra012126 Bra012367 Bra010685 Bra010581 Bra010427 Bra039938 Bra036580 Bra031677 Bra036262 Bra007153 Bra009003 Bra008792 Bra002671 Bra015346 Bra034316 Bra018901 Bra018137 Bra025076 Bra037274 Bra037881 Bra027509 Bra029549 Bra029471 Bra015567 Bra028623 Bra005403 Bra004853 Bra004158"

S11="S11-homozygous-variants.snpeff.ALL.parsed.tsv"
R09="R09-homozygous-variants.snpeff.ALL.parsed.tsv"

S11_out="S11-homozygous-variants.requested_genes.txt"
R09_out="R09-homozygous-variants.requested_genes.txt"

[[ -f $S11_out ]] && rm $S11_out
[[ -f $R09_out ]] && rm $R09_out

# Retrieve all SNPs and indels in the S11 and R09 total sets for the genes requested
for gene in $genes; do
  grep $gene $S11 >> $S11_out
  grep $gene $R09 >> $R09_out
done

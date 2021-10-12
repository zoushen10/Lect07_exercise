# Use esearch then efetch to get the UID values
esearch -db nucleotide -query "Cosmoscarta[organism]"
esearch -db nucleotide -query "Cosmoscarta[organism]" | efetch -db nucleotide -format uid > Cosmoscarta.nuc.gis
head -5 Cosmoscarta.nuc.gis

esearch -db nucleotide -query "Cosmoscarta[organism]" | efetch -db nucleotide -format acc > Cosmoscarta.nuc.acc
head -5 Cosmoscarta.nuc.acc

# Use esearch then efetch to get the fasta seqs
esearch -db nucleotide -query "Cosmoscarta[organism]" | efetch -db nucleotide -format fasta > Cosmoscarta.nuc.fa
head -5 Cosmoscarta.nuc.fa

# How many fasta seqs
grep -c ">" Cosmoscarta.nuc.fa

esearch -db nucleotide -query 1802791303 | efetch -db nucleotide -format gb > Cosmoscarta.first.gb
# Allignment with the help of clustal
clustalo -i Cosmoscarta.nuc.fa -o Cosmoscarta.nuc.allign.fa -v --threads=8
# Draw a plot by plotcon from EMBOSS
plotcon Cosmoscarta.nuc.allign.fa --winsize 100 -graph x11

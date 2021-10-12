cp /localdisk/data/BPSM/Lecture07/* ./
clustalo -i 639cox.fasta -o 639cox.align.fasta -v --threads=8
plotcon 639cox.align.fasta --winsize 4 -graph x11

#!/bin/bash

filename="./filelist.txt"
path="/home/csaba/EMUscRNA/data/scRNA-Seq_Data_Cytena/210519_NB551530_0130_AHK5J7BGXB/Data/Intensities/BaseCalls/CYTENA/pool_joined_lanes/"

while read line; do
	echo "Running on ${line}"
	salmon quant -i /home/csaba/EMUscRNA/genomes/salmon_default -l U -r <(gunzip -c "$path$line") --validateMappings -o "${line%_R1_001.fastq.gz}_quant"
done < $filename
echo "Done"

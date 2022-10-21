#!/bin/bash

path="/home/csaba/EMUscRNA/data/scRNA-Seq_Data_Cytena/210519_NB551530_0130_AHK5J7BGXB/Data/Intensities/BaseCalls/CYTENA/pool_joined_lanes"
filelist="${path}/readfiles_meanl_sd.csv"

while IFS=, read file mean sd
do
        #Run kallisto
	file=${file:1}
	echo "Running on ${file%_R1_001.txt}"
 	kallisto quant -i ../genomes/homo_sapiens_kallisto/transcriptome.idx -o "./results/${file%_R1_001.txt}" --single -l $mean -s $sd -t 8 "$path${file%txt}fastq.gz"       
        #kallisto
done < $filelist
echo "Finished"

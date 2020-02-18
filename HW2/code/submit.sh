#!/bin/bash
#SBATCH -n 1 # Number of cores requested
#SBATCH -N 1 # Ensure that all cores are on one machine
#SBATCH -t 240 # Runtime in minutes
#SBATCH -p serial_requeue # Partition to submit to
#SBATCH --mem=32G # Memory in GB (see also --mem-per-cpu)
#SBATCH -o output_salmon.out # Standard out goes to this file
#SBATCH -e error_salmon.err # Standard err goes to this file

module load salmon/0.12.0-fasrc01
INDEX_FILE="/n/stat115/2020/HW2/salmon_hg38_index"
DATA_FILE="/n/stat115/2020/HW2/raw_data"

for f in Z
do
	salmon quant -i $INDEX_FILE -l A -r $DATA_FILE/run${f}.fastq.gz --validateMappings -o transcripts${f}
done
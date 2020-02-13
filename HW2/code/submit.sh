#!/bin/bash
#SBATCH -n 1 # Number of cores requested
#SBATCH -N 1 # Ensure that all cores are on one machine
#SBATCH -t 30 # Runtime in minutes
#SBATCH -p serial_requeue # Partition to submit to
#SBATCH --mem=32G # Memory in GB (see also --mem-per-cpu)
#SBATCH -o output_star.out # Standard out goes to this file
#SBATCH -e error_star.err # Standard err goes to this file

STAR_FILE="/n/stat115/2020/HW2/star_hg38_index"

module load STAR/2.6.0c-fasrc01

# loop over the four libraries
for f in W X Y Z
do
	STAR --genomeDir $STAR_FILE \
	--outSAMtype BAM SortedByCoordinate \
	--readFilesCommand zcat \
	--readFilesIn run${f}.fastq \
	--runThreadN 1 --outFileNamePrefix output_star
done
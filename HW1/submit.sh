#!/bin/bash
#SBATCH -n 1 # Number of cores requested
#SBATCH -N 1 # Ensure that all cores are on one machine
#SBATCH -t 30 # Runtime in minutes
#SBATCH -p serial_requeue # Partition to submit to
#SBATCH --mem=32G # Memory in GB (see also --mem-per-cpu)
#SBATCH -o output_star.out # Standard out goes to this file
#SBATCH -e error_star.err # Standard err goes to this file

STAR_FILE="/n/stat115/2020/HW1/STARIndex"
READ_FILE="/n/stat115/2020/HW1/loop"

module load STAR/2.6.0c-fasrc01

STAR --genomeDir $STAR_FILE \
--readFilesIn $READ_FILE/A_l.fastq $READ_FILE/A_r.fastq \
--runThreadN 1 --outFileNamePrefix output_star
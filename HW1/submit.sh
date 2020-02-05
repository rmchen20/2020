#!/bin/bash
#SBATCH -n 1 # Number of cores requested
#SBATCH -N 1 # Ensure that all cores are on one machine
#SBATCH -t 15 # Runtime in minutes
#SBATCH -p serial_requeue # Partition to submit to
#SBATCH --mem=1G # Memory in GB (see also --mem-per-cpu)
#SBATCH -o output_%j.out # Standard out goes to this file
#SBATCH -e error_%j.err # Standard err goes to this file

REF_FILE="/n/stat115/2020/HW1/hg38.fasta"
READ_FILE="/n/stat115/2020/HW1/BWA/loop"

module load bwa/0.7.15-fasrc02
module load samtools/1.5-fasrc02

# loop over the three
for f in A B C
do
	# align each end separately
	bwa aln $REF_FILE $READ_FILE/${f}_l.fastq > ${f}_l.sai
	bwa aln $REF_FILE $READ_FILE/${f}_r.fastq > ${f}_r.sai

	# stick everything in a SAM file
	bwa sampe $REF_FILE ${f}_l.sai ${f}_r.sai $READ_FILE/${f}_l.fastq $READ_FILE/${f}_r.fastq > ${f}-aln-pe.sam

	# count number of aligned reads, etc.
	samtools flagstat ${f}-aln-pe.sam

	# count number of uniquely mapped reads
	samtools view -h ${f}-aln-pe.sam | grep -v -e 'XA:Z:'  -e 'SA:Z:'| samtools view -F 0x900 -f 0x2 -q 5| wc -l
done


all: clean index search

clean:
	# Remove any created signature or auxiliary files to always start from scratch
	rm -rf *sig.zip*

index:
	kmerseek \
		index \
		--ksize 16 \
		bcl2_first25_uniprotkb_accession_O43236_OR_accession_2025_02_06.fasta.gz

search:
	 kmerseek \
	 	search \
	 	--ksize 16 \
	 	ced9.fasta \
		bcl2_first25_uniprotkb_accession_O43236_OR_accession_2025_02_06.fasta.gz

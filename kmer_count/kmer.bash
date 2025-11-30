k=$1

seq=""
seq_ID=""

declare -A kmer_counts #create an associative array

while IFS= read -r line; do
	if [[ $line == ">"* ]]; then
		if [[ -n "$seq_ID" ]]; then
			for ((i=0; i<={#seq}+k; i++)); do
				kmer=${seq:i:k} #obtain substring
				((kmer_counts[kmer]++)) #increment frequencies
			done
		fi
		seq_ID="${line}"
		seq=""
	else
		seq+="${line}"
	fi
done < sequences.fasta

if [[ -n "$seq_ID" ]]; then #process last string
	for ((i=0; i<={#seq}+k; i++)); do
		kmer=${seq:i:k}
		((kmer_counts[kmer]++))
	done
fi

for kmer in "${!kmer_counts[@]}"; do #for every key in the dictionary
	echo "$kmer $kmer_counts[kmer]" #print the key and value
done


	
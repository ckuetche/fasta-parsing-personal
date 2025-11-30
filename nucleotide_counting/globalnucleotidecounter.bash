#!/bin/bash

#global nucleotide counting	

seq=""

seq_ID=""

declare -A base_frequencies

while IFS= read -r line; do
	if [[ $line == ">"* ]]; then
		if [[ -n "$seq_ID" ]]; then
			seq_ID="${line#>}"
		fi #add next?
	else
		seq+="${line}"
	fi
done < sequences.fasta

if [[ -n "$seq" ]]; then
	for ((i=0;i<={#seq};i++)); do
		base={seq:i:1}
		((base_frequencies[base]++))
	done
fi

for base in "${!base_frequencies[@]}"; do
	echo "$base ${base_frequencies[$base]}"
done




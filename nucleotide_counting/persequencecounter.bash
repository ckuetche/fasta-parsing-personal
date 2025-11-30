#!/bin/bash

#per sequence counting

seq=""

seq_ID=""

declare -A base_frequencies

while IFS= read -r line; do
	if [[ $line == ">"* ]]; then
		if [[ -n "$seq_ID" ]]; then
			for ((i=0;i<={#seq};i++)); do
				base=${seq:i:1}
				((base_frequencies[$base]++))
			done
			echo "$seq_ID"
			for base in "${!base_frequencies[@]}"; do
				echo "$base ${base_frequencies[$base]}"
			done
			echo
			declare -A base_frequencies
		fi
		seq_ID="${line#>}"
		seq=""
	else
		seq+="${line}"
	fi
done < sequences.fasta

if [[ -n "$seq_ID" ]]; then
	for ((i=0;i<={#seq};i++)); do
		base=${seq:i:1}
		((base_frequencies[$base]++))
	done
fi

echo "$seq_ID"

for base in "${!base_frequencies[@]}"; do
	echo "$base ${base_frequencies[$base]}"
done






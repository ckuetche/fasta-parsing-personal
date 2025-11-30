#!/bin/bash

seq=""
seq_ID=""
max_length=0
longest_ID=""
while IFS= read -r line; do
	if [[ $line == ">"* ]]; then
		if [[ -n "$seq_ID" ]]; then
			if [[ ${#seq} -gt $max_length ]]; then
				max_length=${#seq} #{#...} takes length only
				longest_ID="$seq_ID"
			fi
		fi
		seq_ID="${line#>}"
		seq=""
	else
		seq+="$line"
	fi
done < sequences.fasta

if [[ -n "$seq_ID" ]]; then
	if [[ ${#seq} -gt $max_length ]]; then
		max_length=${#seq}
		longest_ID="$seq_ID"
	fi
fi

echo "$longest_ID $max_length"


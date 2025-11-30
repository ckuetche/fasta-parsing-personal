#!/bin/bash


filename=$1

if [[ -z "$1" ]]; then
	echo "no filename provided"
	exit 1
fi

if [[ ! -r "$filename ]]; then
	echo "cannot read filename"
	exit 1
fi


seq=""
seq_ID=""

positions_list=()

while IFS= read -r line; do
	if [[ $line == ">"* ]]; then
		if [[ -n "$seq_ID" ]]; then
			for ((i=0; i<=${#seq}-3; i++))
				codon=${seq:i:3}
					if [[ "$codon" == "ATG" ]]; then
						positions_list+=("$i")
					fi
			done

			echo "$seq_ID"

			for pos in "${positions_list[@]}"; do
				echo "$pos"
			done
			positions_list=()
		fi
	seq_ID="${line#>}"
	seq=""
	else
		seq+="${line}"
	fi
done < "$filename"

if [[ -n "$seq_ID" ]]; then
	for ((i=0; i<=${#seq}-3; i++))
		codon=${seq:i:3}
			if [[ "$codon" == "ATG" ]]; then
				positions_list+=("$i")
			fi
	done
	
	echo "$seq_ID"
	
	for pos in "${positions_list[@]}"; do
		echo "$pos"
	done
	positions_list=()
fi



				
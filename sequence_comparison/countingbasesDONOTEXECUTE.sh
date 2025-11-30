#Count sequences and output classified length

!#/bin/bash

seq=""
seq_ID=""
total_bases=0

while IFS= read -r line; do
	if [[ $line == ">"* ]]; then
		if [[ -n "$seq_ID" ]]; then
			total_bases=${#seq}
			echo "$seq_ID $total_bases"
			total_bases=0
		fi
		seq_ID="${line#>}"
		seq=""
	else
		seq+="${line}"
	fi
done < sequences.fasta

if [[ -n "$seq_ID" ]]; then
	total_bases=${#seq}
	echo "$seq_ID $total_bases"
fi

#output seq1 9000
	seq2 3948
etc etc


awk '{
    if ($2 < 100) {
        bin["short"]++
    } else if ($2 >= 100 && $2 <= 500) {
        bin["medium"]++
    } else {
        bin["long"]++
    }
}
END {
    for (seq in bin) print seq, bin[seq]
}'
	

make the above bash script executable

chmod +x count_bases.sh

pipe to awk

./count_bases_sh | awk '{
    if ($2 < 100) {
        bin["short"]++
    } else if ($2 >= 100 && $2 <= 500) {
        bin["medium"]++
    } else {
        bin["long"]++
    }
}
END {
    for (seq in bin) print seq, bin[seq]
}'



	





		

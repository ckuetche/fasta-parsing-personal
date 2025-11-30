#per sequence count

awk '

BEGIN {
	seq=""
	seq_ID=""
}

/^>/{
	if (seq != "") {
		for (i=0;i<=length(seq);i++) {
			base=substr(seq,i,1)
			count[base]++
		}

	}
	seq_ID=substr($0,2)
	seq=""
	next
}

!/^>/{
	gsub(/[^A-Za-z]/,"",$0)
	seq = seq $0
}

END{
	if  (seq != "") {
		for (i=0;i<length(seq);i++) {
			base=substr(seq,i,1)
			count[base]++
		}
	}
	for (base in count) {print base, count[base]}
}

'sequences.fasta
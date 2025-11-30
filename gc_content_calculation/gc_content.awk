awk '

BEGIN {seq=""; seq_ID=""}

/^>/ {
if (seq != "") {
	total_bases=length(seq)
	gc_count=0
	for (i=1;i<=length(seq);i++) {
		base=substr(seq,i,1)
			if (base == "G" || base == "C") {
				gc_count++
			}
		}
		gc_content=gc_count/total_bases
		print seq_ID, gc_content
	}
	seq_ID=$0
	sub(/^>/,"",seq_ID)
	seq=""
	next

}

!/^>/ {
gsub(/[^A-Za-z]/, "", $0)
seq = seq $0
}

END {
if (seq != "") {
	total_bases=length(seq)
	gc_count=0
	for (i=1;i<=length(seq);i++) {
		base=substr(seq, i, 1)
			if (base == "G" || base == "C") {
				gc_count++
			}
		}
		gc_content=gc_count/total_bases
		print seq_ID, gc_content
	}
}

' sequences.fasta
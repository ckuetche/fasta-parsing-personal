awk '
BEGIN {
    seq = ""
    seq_ID = ""
}

/^>/ {
    # if we see a new header, just reset the sequence
    seq_ID = substr($0, 2)
    next
}

!/^>/ {
    # clean up and concatenate sequence lines
    gsub(/[^A-Za-z]/, "", $0)
    seq = seq $0
}

END {
    # loop over the final concatenated sequence
    for (i = 1; i <= length(seq); i++) {
        base = substr(seq, i, 1)
        count[base]++
    }

    # print counts
    for (base in count) {
        print base, count[base]
    }
}
' sequences.fasta

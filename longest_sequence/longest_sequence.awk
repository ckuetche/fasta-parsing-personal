awk '
BEGIN {
    seq = ""
    seq_ID = ""
    max_length = 0
    max_ID = ""
}

/^>/ {
    if (seq_ID != "") {
        if (length(seq) > max_length) {
            max_length = length(seq)
            max_ID = seq_ID
        }
    }
    seq_ID = $0
    sub(/^>/, "", seq_ID)
    seq = ""
    next
}

!/^>/ {
    gsub(/[^A-Za-z]/, "", $0)
    seq = seq $0
}

END {
    if (seq_ID != "") {
        if (length(seq) > max_length) {
            max_length = length(seq)
            max_ID = seq_ID
        }
    }
    print max_ID, max_length
}
' sequences.fasta

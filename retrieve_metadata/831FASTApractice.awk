#print sequence IDs and length of sequence
awk '/^>/{
    if (NR>1) {print seq_ID, length(seq)}
    seq_ID = gsub(">", "", $0); seq_ID = $0
    seq = ""
    next
    }
    !/^>/{
    seq = seq gensub(/[^A-Za-z]/, "", "g", $0)
    }
    END{print seq_ID, length(seq)}' sequences.fasta
    